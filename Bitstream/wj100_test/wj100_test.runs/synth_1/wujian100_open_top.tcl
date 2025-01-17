# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a200tfbg484-2L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.cache/wt [current_project]
set_property parent.project_path E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog {
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/apb1_params.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/wdt_params.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/apb0_params.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/timers_params.v
}
set_property file_type "Verilog Header" [get_files E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/apb1_params.v]
set_property file_type "Verilog Header" [get_files E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/wdt_params.v]
set_property file_type "Verilog Header" [get_files E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/apb0_params.v]
set_property file_type "Verilog Header" [get_files E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/params/timers_params.v]
read_verilog -library xil_defaultlib {
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/fpga/wujian100_open_fpga_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/E902_20191018.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/sim_lib/PAD_DIG_IO.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/sim_lib/PAD_OSC_IO.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/ahb_matrix_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/aou_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/apb0.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/apb0_sub_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/apb1.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/apb1_sub_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/clkgen.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/common.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/core_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/dmac.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/dummy.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/sim_lib/fpga_byte_spram.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/sim_lib/fpga_spram.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/gpio0.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/ls_sub_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/matrix.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/pdu_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/pwm.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/retu_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/rtc.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/sms.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/smu_top.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim1.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim2.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim3.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim4.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim5.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim6.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/tim7.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/usi0.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/usi1.v
  E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/sources_1/imports/wujian100_open/soc/wdt.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/constrs_1/imports/xdc/XC7A200T3B.xdc
set_property used_in_implementation false [get_files E:/Documents/GitHub/ZhixinTongde_WJ100/Bitstream/wj100_test/wj100_test.srcs/constrs_1/imports/xdc/XC7A200T3B.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top wujian100_open_top -part xc7a200tfbg484-2L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef wujian100_open_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file wujian100_open_top_utilization_synth.rpt -pb wujian100_open_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
