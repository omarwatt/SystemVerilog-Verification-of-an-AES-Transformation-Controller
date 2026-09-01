# Run from the repository root in a simulator supporting SVA and covergroups.
source [file join [file dirname [info script]] common.do]
prepare_run verification
set rtl [file join $repo_root rtl]
vlog -work work +cover=bcst \
    [file join $rtl sbox.v] \
    [file join $rtl subbytes.v] \
    [file join $rtl mix_coloumns.v] \
    [file join $rtl fsm.v]
vlog -work work -sv +cover=bcst [file join $repo_root tb sv_tb.sv]
vsim -coverage -voptargs=+acc work.fsm_tb_sv
onfinish stop
do [file join $repo_root results part3 wave3.do]
# Bound the original unbounded wait(done) statements without changing the HDL.
run 2 us
coverage save [file join $run_dir coverage.ucdb]
coverage report -details -output [file join $run_dir coverage.txt]
set checks_passed [examine -radix decimal /fsm_tb_sv/passed]
set checks_failed [examine -radix decimal /fsm_tb_sv/failed]
cd $repo_root
if {$checks_passed != 12 || $checks_failed != 0} {
    error "Incomplete or failed output checks: passed=$checks_passed failed=$checks_failed. Inspect transcript.log."
}
puts "All 12 output comparisons passed. Inspect assertion and coverage results separately."
