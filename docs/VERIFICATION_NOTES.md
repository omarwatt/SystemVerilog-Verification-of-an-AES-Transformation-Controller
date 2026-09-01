# Verification Notes

## Final source and design history

Only the final Part 3 RTL and SystemVerilog testbench are active in this repository. The earlier implementation is represented by its report and archived outputs, not by a second source tree.

Part 1 encodes Reset/SubBytes/MixColumns as 00/01/10. It latches the operation mode in `op_chain`, stores the SubBytes result in `mid_reg`, and returns to Reset after an operation. Its FSM testbench instantiates the same SubBytes and MixColumns RTL as a reference. That helps check controller sequencing, but it is not an independent mathematical reference for the datapath.

Part 2 encodes the states as 01/00/10, removes `mid_reg` and `op_chain`, feeds SubBytes directly into MixColumns, and uses `calc_wait` for completion signaling. It stays in an operating state until the mode changes. Its stimulus alternates the modes. Repeated transactions in one unchanged mode are not established by this directed sequence.

Part 3's four RTL files and SystemVerilog testbench are byte-identical to Part 2. They are stored once in `rtl/` and `tb/`, copied from Part 3. The mapped netlist in `netlist/fsm_gate.v` defines the same top-level module, `fsm`; never compile both definitions into one work library.

## Archived evidence and source differences

- The Part 2 and Part 3 console screenshots are identical. They report 12 passing data checks, with all-zero and all-one vectors in the first two groups.
- The supplied SystemVerilog source uses `19f48d08a0c648be9af8e32be93de22a` in each of its first three groups. It still contains 12 comparisons, but it does not reproduce the archived input sequence exactly.
- The Part 2 report prose mentions eight passes in one paragraph; the actual console and coverage hit counts support 12 comparisons.
- The coverage text is retained as evidence of an archived run. It does not prove that an unchanged rerun of the supplied source will achieve the same coverage.
- The Part 1 console includes a timeout after the test drives `s=11` and waits for completion. Because `s[0]` is the synchronous reset, `done` is held low in this condition. This is a reset-test expectation issue, not evidence that the earlier SubBytes and chain comparisons failed.

## Coverage scope

The FSM source report lists 100% statement, branch, and condition coverage, and 98.31% toggle coverage. These figures apply to `fsm.v`; they do not represent exhaustive S-box or MixColumns data testing.

The functional model contains five state/command bins and three transition bins. Its 100% result covers precisely that model. It does not include every legal FSM transition, all input vectors, random stimulus, or cross coverage. The reported filtered code total of 88.21% also includes testbench code; uncovered checker error paths contribute to the difference.

The assertion table records zero failures and one pass count for each of the two properties. Preserve those reported counts rather than interpreting them as a count of all checked transactions. Assertion failures are not added to the testbench's `failed` variable.

## Run and automation limits

The final SystemVerilog driver deasserts `start` at a positive clock edge, which creates a simulator scheduling race with DUT input sampling. It also has unbounded `wait(done)` statements. `scripts/run_verification.do` limits the run to 2 µs and checks that the data-comparison counters reach 12/0, but it does not repair the original driver or convert assertion results into that counter.

The archived Part 1 MixColumns test prints input/output values and has no expected-value assertions. The archived FSM test prints two functional comparisons and the reset-related timeout described above. Those earlier benches and their run helpers are not included in the unified final-source project.

For gate-level simulation, the original SV testbench's references to `dut.State_Reset`, `dut.State_SubBytes`, and `dut.State_MixColms` cannot bind to the mapped netlist, which does not preserve those localparam names. An adapted bench is required. No gate-level adapter, SDF file, synthesis script, `.db` library, or timing-constraint file was supplied; none is represented as an original project deliverable.

## Synthesis interpretation

The total-cell-area numbers are reported in the library's area units; the screenshots do not establish a unit conversion to square micrometres. Power figures are synthesis estimates for the reported setup. The timing screenshots identify `Path Type: min` and hold-time checks. Subtracting their slack from a clock period cannot establish Fmax, so the README does not repeat the report's derived frequency estimates.
