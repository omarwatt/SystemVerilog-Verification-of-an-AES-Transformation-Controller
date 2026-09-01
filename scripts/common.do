# Packaging helper; original HDL and testbench files are unchanged.
set repo_root [file normalize [file join [file dirname [info script]] ..]]

proc prepare_run {name} {
    global repo_root run_dir
    catch {quit -sim}
    set run_dir [file join $repo_root build $name]
    file mkdir $run_dir
    cd $run_dir
    if {![file exists modelsim.ini]} {
        vmap -c
    }
    if {![file isdirectory work]} {
        vlib work
    }
    vmap work [file join $run_dir work]
    transcript file [file join $run_dir transcript.log]
    transcript on
}
