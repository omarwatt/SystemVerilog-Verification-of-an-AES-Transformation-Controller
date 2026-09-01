# Compile only: the supplied SV bench needs adaptation for mapped state names.
source [file join [file dirname [info script]] common.do]
set model [file join $repo_root vendor slow.v]
if {[info exists env(ARTISAN_SLOW_MODEL)]} {
    set model [file normalize $env(ARTISAN_SLOW_MODEL)]
}
if {![file isfile $model]} {
    error "Cell models not found. Provide vendor/slow.v or ARTISAN_SLOW_MODEL; see vendor/README.md."
}
prepare_run gate
vlog -work work $model [file join $repo_root netlist fsm_gate.v]
cd $repo_root
puts "Gate netlist compiled. No gate-level regression was run; see docs/VERIFICATION_NOTES.md."
