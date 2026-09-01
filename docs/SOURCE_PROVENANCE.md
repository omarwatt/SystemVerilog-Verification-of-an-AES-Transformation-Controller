# Source Provenance

This repository combines `part1(1).rar`, `part2(1).rar`, and `part3(1).rar` into one project. **Part 3 supplies the final RTL, SystemVerilog testbench, and mapped netlist.** The retained files are byte-for-byte copies of the submissions; HDL behavior has not been changed.

## Consolidation

- `rtl/` contains exactly four final source files. `tb/` contains the final `sv_tb.sv`.
- Part 2's RTL and SystemVerilog files are identical to Part 3's and resolve to those same copies.
- Earlier Part 1 RTL and testbenches are omitted. Its report and simulation screenshots preserve the design history without introducing a second active implementation.
- `netlist/fsm_gate.v` is the mapped clock-gated implementation. It shares the module name `fsm` with the RTL and must be compiled separately.
- All three reports, original explanatory text files, and result files are retained. The original text files describe the submission layouts; use the root README for current paths and execution instructions.
- The proprietary `slow.v` model is external; see [dependency instructions](../vendor/README.md).
- Original names, including `mix_coloumns.v`, are retained. Report authorship and source notices are preserved.

## Packaging additions and checks

The root README, documentation notes, `.gitignore`, and run helpers were added during assembly. The five README figures were copied or extracted from supplied material; see [image sources](IMAGE_SOURCES.md).

The helpers select the final source files and isolate RTL and gate work libraries. The RTL helper bounds execution and checks the data-comparison counters. The gate helper only compiles; it does not run a gate-level regression.

Preserved-file checksums, relative Markdown links, and ZIP integrity were checked. Tcl control flow and source paths were checked with simulator commands stubbed, including a repository path containing spaces and error branches for incomplete comparisons and a missing cell model. These checks do not validate simulator option support or execute HDL.

No HDL simulation or synthesis was rerun during assembly. The README's numerical results come from the archived reports and outputs. Known source/evidence differences are recorded in [verification notes](VERIFICATION_NOTES.md).

## File mapping

[source-manifest.json](source-manifest.json) records SHA-256 hashes for all supplied files and explains exclusions. Multiple source rows may refer to one identical final file.

| Stage | Original path within submission | Repository path |
| --- | --- | --- |
| part1 | `DDLS-part1.pdf` | `docs/reports/part1-rtl-design.pdf` |
| part1 | `DUT/sbox.v` | `rtl/sbox.v` |
| part1 | `DUT/subbytes.v` | `rtl/subbytes.v` |
| part1 | `README.txt` | `docs/original-readmes/part1.txt` |
| part1 | `TB outputs/Mixclomuns_output_waveform.png` | `results/part1/Mixclomuns_output_waveform.png` |
| part1 | `TB outputs/Mixcolumns_monitor_output.png` | `results/part1/Mixcolumns_monitor_output.png` |
| part1 | `TB outputs/fsm_monitor_output.png` | `results/part1/fsm_monitor_output.png` |
| part1 | `TB outputs/fsm_output_waveform.png` | `results/part1/fsm_output_waveform.png` |
| part2 | `DDLS_part2.pdf` | `docs/reports/part2-systemverilog-verification.pdf` |
| part2 | `DUT/fsm.v` | `rtl/fsm.v` |
| part2 | `DUT/mix_coloumns.v` | `rtl/mix_coloumns.v` |
| part2 | `DUT/sbox.v` | `rtl/sbox.v` |
| part2 | `DUT/subbytes.v` | `rtl/subbytes.v` |
| part2 | `README.txt` | `docs/original-readmes/part2.txt` |
| part2 | `TB (sv verification)/sv_tb.sv` | `tb/sv_tb.sv` |
| part2 | `TB outputs/TB_console_outputs.png` | `results/part2/TB_console_outputs.png` |
| part2 | `TB outputs/coverage_report_fsm.txt` | `results/part2/coverage_report_fsm.txt` |
| part2 | `TB outputs/list2.do` | `results/part2/list2.do` |
| part2 | `TB outputs/wave2.do` | `results/part2/wave2.do` |
| part3 | `DDLS_part3.pdf` | `docs/reports/part3-clock-gating-synthesis.pdf` |
| part3 | `DUT/fsm.v` | `rtl/fsm.v` |
| part3 | `DUT/fsm_gate.v` | `netlist/fsm_gate.v` |
| part3 | `DUT/mix_coloumns.v` | `rtl/mix_coloumns.v` |
| part3 | `DUT/sbox.v` | `rtl/sbox.v` |
| part3 | `DUT/subbytes.v` | `rtl/subbytes.v` |
| part3 | `README.txt` | `docs/original-readmes/part3.txt` |
| part3 | `TB (sv verification)/sv_tb.sv` | `tb/sv_tb.sv` |
| part3 | `TB outputs/TB_console_outputs.png` | `results/part3/TB_console_outputs.png` |
| part3 | `TB outputs/list3.do` | `results/part3/list3.do` |
| part3 | `TB outputs/wave3.do` | `results/part3/wave3.do` |
