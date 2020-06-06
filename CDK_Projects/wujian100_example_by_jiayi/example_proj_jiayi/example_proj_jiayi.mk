##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=example_proj_jiayi
ConfigurationName      :=BuildSet
WorkspacePath          :=E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/
ProjectPath            :=E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=lijia
Date                   :=09/05/2020
CDKPath                :=D:/software/C-Sky/CDK/
LinkerName             :=riscv64-unknown-elf-gcc
LinkerNameoption       :=
SIZE                   :=riscv64-unknown-elf-size
READELF                :=riscv64-unknown-elf-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="example_proj_jiayi.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mabi=ilp32e -march=rv32emcxthead  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/board/wujian100_open_evb/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024
IncludePackagePath     :=
IncludeCPath           :=$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)configs" $(IncludeSwitch)"$(ProjectPath)board/smartl_rv32_evb/include" $(IncludeSwitch)"$(ProjectPath)board/wujian100_open_evb/include" $(IncludeSwitch)"$(ProjectPath)csi_core/include" $(IncludeSwitch)"$(ProjectPath)csi_driver/include" $(IncludeSwitch)"$(ProjectPath)csi_driver/smartl_rv32/include" $(IncludeSwitch)"$(ProjectPath)csi_driver/wujian100_open/include" $(IncludeSwitch)"$(ProjectPath)csi_kernel/include" $(IncludeSwitch)"$(ProjectPath)csi_kernel/rhino/arch/include" $(IncludeSwitch)"$(ProjectPath)csi_kernel/rhino/common" $(IncludeSwitch)"$(ProjectPath)csi_kernel/rhino/core/include" $(IncludeSwitch)"$(ProjectPath)csi_kernel/rhino/driver" $(IncludeSwitch)"$(ProjectPath)csi_kernel/rhino/pwrmgmt" $(IncludeSwitch)"$(ProjectPath)include" $(IncludeSwitch)"$(ProjectPath)libs/include" $(IncludeSwitch)"$(ProjectPath)libs/include/ringbuffer" $(IncludeSwitch)"$(ProjectPath)libs/include/sys" $(IncludeSwitch)"$(ProjectPath)user_lib/inc"  
IncludeAPath           :=$(IncludeSwitch)"$(ProjectPath)" -Wa,$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)configs" -Wa,$(IncludeSwitch)"$(ProjectPath)configs"  
Libs                   := -Wl,--whole-archive  -Wl,--no-whole-archive $(LibrarySwitch)m  
ArLibs                 := "m" 
PackagesLibPath        :=
LibPath                := $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=riscv64-unknown-elf-ar rcu
CXX      :=riscv64-unknown-elf-g++
CC       :=riscv64-unknown-elf-gcc
AS       :=riscv64-unknown-elf-gcc
OBJDUMP  :=riscv64-unknown-elf-objdump
OBJCOPY  :=riscv64-unknown-elf-objcopy
CXXFLAGS := -mabi=ilp32e -march=rv32emcxthead    -Os  -g3  -Wall -ffunction-sections -fdata-sections 
CFLAGS   := -mabi=ilp32e -march=rv32emcxthead    -Os  -g3  -Wall -ffunction-sections -fdata-sections 
ASFLAGS  := -mabi=ilp32e -march=rv32emcxthead    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/main_main$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) \
	$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) \
	$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) $(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) \
	$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) \
	$(IntermediateDirectory)/src_user_gpio$(ObjectSuffix) $(IntermediateDirectory)/src_user_timer$(ObjectSuffix) $(IntermediateDirectory)/src_user_uart$(ObjectSuffix) $(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) $(IntermediateDirectory)/board_board_cpu_pwr$(ObjectSuffix) $(IntermediateDirectory)/board_board_cpu_pwr_rtc$(ObjectSuffix) $(IntermediateDirectory)/board_board_cpu_pwr_systick$(ObjectSuffix) $(IntermediateDirectory)/board_board_cpu_pwr_timer$(ObjectSuffix) $(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) $(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) \
	$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) $(IntermediateDirectory)/common_k_trace$(ObjectSuffix) $(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) $(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) $(IntermediateDirectory)/core_k_err$(ObjectSuffix) $(IntermediateDirectory)/core_k_event$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) $(IntermediateDirectory)/core_k_obj$(ObjectSuffix) $(IntermediateDirectory)/core_k_pend$(ObjectSuffix) $(IntermediateDirectory)/core_k_queue$(ObjectSuffix) $(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) $(IntermediateDirectory)/core_k_sched$(ObjectSuffix) $(IntermediateDirectory)/core_k_sem$(ObjectSuffix) $(IntermediateDirectory)/core_k_stats$(ObjectSuffix) $(IntermediateDirectory)/core_k_sys$(ObjectSuffix) $(IntermediateDirectory)/core_k_task$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) $(IntermediateDirectory)/core_k_tick$(ObjectSuffix) $(IntermediateDirectory)/core_k_time$(ObjectSuffix) $(IntermediateDirectory)/core_k_timer$(ObjectSuffix) $(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) $(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) $(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) $(IntermediateDirectory)/driver_systick$(ObjectSuffix) $(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) $(IntermediateDirectory)/riscv_cpu_impl$(ObjectSuffix) \
	$(IntermediateDirectory)/riscv_csky_sched$(ObjectSuffix) $(IntermediateDirectory)/riscv_port_c$(ObjectSuffix) $(IntermediateDirectory)/riscv_port_s$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all clean MakeIntermediateDirs
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(IntermediateDirectory)/.d $(Objects) 
	@echo "" > $(IntermediateDirectory)/.d
	@touch  $(ObjectsFileList)
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo $(Objects1) >> $(ObjectsFileList)
	@echo linking...
	@$(LinkerName) $(OutputSwitch)"$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" $(LinkerNameoption) @$(ObjectsFileList) $(LibraryPathSwitch)E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs  -Wl,--whole-archive $(LibrarySwitch)newlib_wrap   -Wl,--no-whole-archive  $(LinkOptions) $(LibPath) $(Libs) $(LinkOtherFlagsOption)
	@echo size of target:
	@$(SIZE) "$(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	@echo -n "checksum value of target:  "
	@$(CHECKSUM) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	
MakeIntermediateDirs:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst

$(IntermediateDirectory)/.d:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst



##
## Objects
##
$(IntermediateDirectory)/main_main$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/main/main.c  
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/main/main.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main_main$(ObjectSuffix) -MF$(IntermediateDirectory)/main_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main_main$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/main/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main_main$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/main/main.c"

$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/board/wujian100_open_evb/board_init.c  
	@echo compiling board_init.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/board/wujian100_open_evb/board_init.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_evb_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_evb_board_init$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/board/wujian100_open_evb/board_init.c
	@echo generating preprocess file of board_init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_evb_board_init$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/board/wujian100_open_evb/board_init.c"

$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/devices.c  
	@echo compiling devices.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/devices.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_devices$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_devices$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/devices.c
	@echo generating preprocess file of devices.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_devices$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/devices.c"

$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/isr.c  
	@echo compiling isr.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/isr.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_isr$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/isr.c
	@echo generating preprocess file of isr.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_isr$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/isr.c"

$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/lib.c  
	@echo compiling lib.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/lib.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_lib$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_lib$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/lib.c
	@echo generating preprocess file of lib.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_lib$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/lib.c"

$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/novic_irq_tbl.c  
	@echo compiling novic_irq_tbl.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/novic_irq_tbl.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_novic_irq_tbl$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/novic_irq_tbl.c
	@echo generating preprocess file of novic_irq_tbl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_novic_irq_tbl$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/novic_irq_tbl.c"

$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/pinmux.c  
	@echo compiling pinmux.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/pinmux.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_pinmux$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_pinmux$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/pinmux.c
	@echo generating preprocess file of pinmux.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_pinmux$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/pinmux.c"

$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/startup.S  
	@echo assembling startup.S...
	@$(AS) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/startup.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/wujian100_open_startup$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/startup.S
	@echo generating preprocess file of startup.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_startup$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/startup.S"

$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/system.c  
	@echo compiling system.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/system.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_system$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/system.c
	@echo generating preprocess file of system.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_system$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/system.c"

$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/sys_freq.c  
	@echo compiling sys_freq.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/sys_freq.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_sys_freq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_sys_freq$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/sys_freq.c
	@echo generating preprocess file of sys_freq.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_sys_freq$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/sys_freq.c"

$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/trap_c.c  
	@echo compiling trap_c.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/trap_c.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_trap_c$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/trap_c.c
	@echo generating preprocess file of trap_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_trap_c$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/trap_c.c"

$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/vectors.S  
	@echo assembling vectors.S...
	@$(AS) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/vectors.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/wujian100_open_vectors$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/vectors.S
	@echo generating preprocess file of vectors.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_vectors$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/vectors.S"

$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_dmac_v2.c  
	@echo compiling wj_dmac_v2.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_dmac_v2.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_dmac_v2$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_dmac_v2.c
	@echo generating preprocess file of wj_dmac_v2.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_dmac_v2$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_dmac_v2.c"

$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_irq.c  
	@echo compiling wj_irq.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_irq.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_irq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_irq$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_irq.c
	@echo generating preprocess file of wj_irq.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_irq$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_irq.c"

$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_gpio.c  
	@echo compiling wj_oip_gpio.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_gpio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_gpio$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_gpio.c
	@echo generating preprocess file of wj_oip_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_gpio$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_gpio.c"

$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_timer.c  
	@echo compiling wj_oip_timer.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_timer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_timer$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_timer.c
	@echo generating preprocess file of wj_oip_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_timer$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_timer.c"

$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_wdt.c  
	@echo compiling wj_oip_wdt.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_wdt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_wdt$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_wdt.c
	@echo generating preprocess file of wj_oip_wdt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_wdt$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_oip_wdt.c"

$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_pwm.c  
	@echo compiling wj_pwm.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_pwm.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_pwm$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_pwm.c
	@echo generating preprocess file of wj_pwm.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_pwm$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_pwm.c"

$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_rtc.c  
	@echo compiling wj_rtc.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_rtc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_rtc$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_rtc.c
	@echo generating preprocess file of wj_rtc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_rtc$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_rtc.c"

$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi.c  
	@echo compiling wj_usi.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi.c
	@echo generating preprocess file of wj_usi.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_iic.c  
	@echo compiling wj_usi_iic.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_iic.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_iic$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_iic.c
	@echo generating preprocess file of wj_usi_iic.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_iic$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_iic.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_spi.c  
	@echo compiling wj_usi_spi.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_spi.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_spi$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_spi.c
	@echo generating preprocess file of wj_usi_spi.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_spi$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_spi.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_usart.c  
	@echo compiling wj_usi_usart.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_usart.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_usart$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_usart.c
	@echo generating preprocess file of wj_usi_usart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_usart$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_usart.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_wrap.c  
	@echo compiling wj_usi_wrap.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_wrap.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_wrap$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_wrap.c
	@echo generating preprocess file of wj_usi_wrap.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_wrap$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_driver/wujian100_open/wj_usi_wrap.c"

$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/clock_gettime.c  
	@echo compiling clock_gettime.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/clock_gettime.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_clock_gettime$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_clock_gettime$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/clock_gettime.c
	@echo generating preprocess file of clock_gettime.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_clock_gettime$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/clock_gettime.c"

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/malloc.c  
	@echo compiling malloc.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/malloc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_malloc$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/malloc.c
	@echo generating preprocess file of malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/malloc.c"

$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/minilibc_port.c  
	@echo compiling minilibc_port.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/minilibc_port.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_minilibc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_minilibc_port$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/minilibc_port.c
	@echo generating preprocess file of minilibc_port.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_minilibc_port$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/minilibc_port.c"

$(IntermediateDirectory)/libc__init$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/_init.c  
	@echo compiling _init.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/_init.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc__init$(ObjectSuffix) -MF$(IntermediateDirectory)/libc__init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc__init$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/_init.c
	@echo generating preprocess file of _init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc__init$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/libc/_init.c"

$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_addlast.c  
	@echo compiling dq_addlast.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_addlast.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_addlast$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_addlast$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_addlast.c
	@echo generating preprocess file of dq_addlast.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_addlast$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_addlast.c"

$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_rem.c  
	@echo compiling dq_rem.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_rem.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_rem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_rem$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_rem.c
	@echo generating preprocess file of dq_rem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_rem$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/dq_rem.c"

$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/lib_mallinfo.c  
	@echo compiling lib_mallinfo.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/lib_mallinfo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_lib_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_lib_mallinfo$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/lib_mallinfo.c
	@echo generating preprocess file of lib_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_lib_mallinfo$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/lib_mallinfo.c"

$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_addfreechunk.c  
	@echo compiling mm_addfreechunk.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_addfreechunk.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_addfreechunk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_addfreechunk$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_addfreechunk.c
	@echo generating preprocess file of mm_addfreechunk.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_addfreechunk$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_addfreechunk.c"

$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_free.c  
	@echo compiling mm_free.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_free.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_free$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_free$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_free.c
	@echo generating preprocess file of mm_free.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_free$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_free.c"

$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_initialize.c  
	@echo compiling mm_initialize.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_initialize.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_initialize$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_initialize$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_initialize.c
	@echo generating preprocess file of mm_initialize.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_initialize$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_initialize.c"

$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_leak.c  
	@echo compiling mm_leak.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_leak.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_leak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_leak$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_leak.c
	@echo generating preprocess file of mm_leak.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_leak$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_leak.c"

$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_mallinfo.c  
	@echo compiling mm_mallinfo.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_mallinfo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_mallinfo$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_mallinfo.c
	@echo generating preprocess file of mm_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_mallinfo$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_mallinfo.c"

$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_malloc.c  
	@echo compiling mm_malloc.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_malloc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_malloc$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_malloc.c
	@echo generating preprocess file of mm_malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_malloc$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_malloc.c"

$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_size2ndx.c  
	@echo compiling mm_size2ndx.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_size2ndx.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_size2ndx$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_size2ndx$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_size2ndx.c
	@echo generating preprocess file of mm_size2ndx.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_size2ndx$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/mm/mm_size2ndx.c"

$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/ringbuffer/ringbuffer.c  
	@echo compiling ringbuffer.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/ringbuffer/ringbuffer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) -MF$(IntermediateDirectory)/ringbuffer_ringbuffer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ringbuffer_ringbuffer$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/ringbuffer/ringbuffer.c
	@echo generating preprocess file of ringbuffer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ringbuffer_ringbuffer$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/ringbuffer/ringbuffer.c"

$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/syslog/syslog.c  
	@echo compiling syslog.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/syslog/syslog.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) -MF$(IntermediateDirectory)/syslog_syslog$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/syslog_syslog$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/syslog/syslog.c
	@echo generating preprocess file of syslog.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/syslog_syslog$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/libs/syslog/syslog.c"

$(IntermediateDirectory)/src_user_gpio$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_gpio.c  
	@echo compiling user_gpio.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_gpio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_user_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/src_user_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_user_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_user_gpio$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_gpio.c
	@echo generating preprocess file of user_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_user_gpio$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_gpio.c"

$(IntermediateDirectory)/src_user_timer$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_timer.c  
	@echo compiling user_timer.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_timer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_user_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/src_user_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_user_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_user_timer$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_timer.c
	@echo generating preprocess file of user_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_user_timer$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_timer.c"

$(IntermediateDirectory)/src_user_uart$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_uart.c  
	@echo compiling user_uart.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_uart.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_user_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/src_user_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_user_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_user_uart$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_uart.c
	@echo generating preprocess file of user_uart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_user_uart$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/user_lib/src/user_uart.c"

$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/adapter/csi_rhino.c  
	@echo compiling csi_rhino.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/adapter/csi_rhino.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) -MF$(IntermediateDirectory)/adapter_csi_rhino$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/adapter_csi_rhino$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/adapter/csi_rhino.c
	@echo generating preprocess file of csi_rhino.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/adapter_csi_rhino$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/adapter/csi_rhino.c"

$(IntermediateDirectory)/board_board_cpu_pwr$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr.c  
	@echo compiling board_cpu_pwr.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/board_board_cpu_pwr$(ObjectSuffix) -MF$(IntermediateDirectory)/board_board_cpu_pwr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/board_board_cpu_pwr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/board_board_cpu_pwr$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr.c
	@echo generating preprocess file of board_cpu_pwr.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/board_board_cpu_pwr$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr.c"

$(IntermediateDirectory)/board_board_cpu_pwr_rtc$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_rtc.c  
	@echo compiling board_cpu_pwr_rtc.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_rtc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/board_board_cpu_pwr_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/board_board_cpu_pwr_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/board_board_cpu_pwr_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/board_board_cpu_pwr_rtc$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_rtc.c
	@echo generating preprocess file of board_cpu_pwr_rtc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/board_board_cpu_pwr_rtc$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_rtc.c"

$(IntermediateDirectory)/board_board_cpu_pwr_systick$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_systick.c  
	@echo compiling board_cpu_pwr_systick.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_systick.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/board_board_cpu_pwr_systick$(ObjectSuffix) -MF$(IntermediateDirectory)/board_board_cpu_pwr_systick$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/board_board_cpu_pwr_systick$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/board_board_cpu_pwr_systick$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_systick.c
	@echo generating preprocess file of board_cpu_pwr_systick.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/board_board_cpu_pwr_systick$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_systick.c"

$(IntermediateDirectory)/board_board_cpu_pwr_timer$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_timer.c  
	@echo compiling board_cpu_pwr_timer.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_timer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/board_board_cpu_pwr_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/board_board_cpu_pwr_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/board_board_cpu_pwr_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/board_board_cpu_pwr_timer$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_timer.c
	@echo generating preprocess file of board_cpu_pwr_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/board_board_cpu_pwr_timer$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/board/board_cpu_pwr_timer.c"

$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_atomic.c  
	@echo compiling k_atomic.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_atomic.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_atomic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_atomic$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_atomic.c
	@echo generating preprocess file of k_atomic.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_atomic$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_atomic.c"

$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_ffs.c  
	@echo compiling k_ffs.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_ffs.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_ffs$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_ffs$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_ffs.c
	@echo generating preprocess file of k_ffs.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_ffs$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_ffs.c"

$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_fifo.c  
	@echo compiling k_fifo.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_fifo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_fifo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_fifo$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_fifo.c
	@echo generating preprocess file of k_fifo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_fifo$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_fifo.c"

$(IntermediateDirectory)/common_k_trace$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_trace.c  
	@echo compiling k_trace.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_trace.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_trace$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_trace$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_trace$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_trace$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_trace.c
	@echo generating preprocess file of k_trace.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_trace$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/common/k_trace.c"

$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_buf_queue.c  
	@echo compiling k_buf_queue.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_buf_queue.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_buf_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_buf_queue$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_buf_queue.c
	@echo generating preprocess file of k_buf_queue.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_buf_queue$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_buf_queue.c"

$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_dyn_mem_proc.c  
	@echo compiling k_dyn_mem_proc.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_dyn_mem_proc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_dyn_mem_proc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_dyn_mem_proc$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_dyn_mem_proc.c
	@echo generating preprocess file of k_dyn_mem_proc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_dyn_mem_proc$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_dyn_mem_proc.c"

$(IntermediateDirectory)/core_k_err$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_err.c  
	@echo compiling k_err.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_err.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_err$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_err$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_err$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_err$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_err.c
	@echo generating preprocess file of k_err.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_err$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_err.c"

$(IntermediateDirectory)/core_k_event$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_event.c  
	@echo compiling k_event.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_event.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_event$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_event$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_event$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_event$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_event.c
	@echo generating preprocess file of k_event.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_event$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_event.c"

$(IntermediateDirectory)/core_k_idle$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_idle.c  
	@echo compiling k_idle.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_idle.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_idle$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_idle$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_idle.c
	@echo generating preprocess file of k_idle.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_idle$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_idle.c"

$(IntermediateDirectory)/core_k_mm$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm.c  
	@echo compiling k_mm.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mm$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mm$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm.c
	@echo generating preprocess file of k_mm.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm.c"

$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_blk.c  
	@echo compiling k_mm_blk.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_blk.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm_blk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mm_blk$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_blk.c
	@echo generating preprocess file of k_mm_blk.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm_blk$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_blk.c"

$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_debug.c  
	@echo compiling k_mm_debug.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_debug.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm_debug$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mm_debug$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_debug.c
	@echo generating preprocess file of k_mm_debug.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm_debug$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mm_debug.c"

$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mutex.c  
	@echo compiling k_mutex.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mutex.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mutex$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mutex$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mutex.c
	@echo generating preprocess file of k_mutex.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mutex$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_mutex.c"

$(IntermediateDirectory)/core_k_obj$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_obj.c  
	@echo compiling k_obj.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_obj.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_obj$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_obj$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_obj$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_obj$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_obj.c
	@echo generating preprocess file of k_obj.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_obj$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_obj.c"

$(IntermediateDirectory)/core_k_pend$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_pend.c  
	@echo compiling k_pend.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_pend.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_pend$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_pend$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_pend$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_pend$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_pend.c
	@echo generating preprocess file of k_pend.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_pend$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_pend.c"

$(IntermediateDirectory)/core_k_queue$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_queue.c  
	@echo compiling k_queue.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_queue.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_queue$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_queue.c
	@echo generating preprocess file of k_queue.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_queue$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_queue.c"

$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_ringbuf.c  
	@echo compiling k_ringbuf.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_ringbuf.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_ringbuf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_ringbuf$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_ringbuf.c
	@echo generating preprocess file of k_ringbuf.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_ringbuf$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_ringbuf.c"

$(IntermediateDirectory)/core_k_sched$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sched.c  
	@echo compiling k_sched.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sched.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sched$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sched$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_sched$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sched.c
	@echo generating preprocess file of k_sched.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sched$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sched.c"

$(IntermediateDirectory)/core_k_sem$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sem.c  
	@echo compiling k_sem.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sem.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_sem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_sem$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sem.c
	@echo generating preprocess file of k_sem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sem$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sem.c"

$(IntermediateDirectory)/core_k_stats$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_stats.c  
	@echo compiling k_stats.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_stats.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_stats$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_stats$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_stats$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_stats$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_stats.c
	@echo generating preprocess file of k_stats.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_stats$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_stats.c"

$(IntermediateDirectory)/core_k_sys$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sys.c  
	@echo compiling k_sys.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sys.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_sys$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sys$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sys$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_sys$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sys.c
	@echo generating preprocess file of k_sys.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sys$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_sys.c"

$(IntermediateDirectory)/core_k_task$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task.c  
	@echo compiling k_task.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_task$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_task$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_task$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_task$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task.c
	@echo generating preprocess file of k_task.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_task$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task.c"

$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task_sem.c  
	@echo compiling k_task_sem.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task_sem.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_task_sem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_task_sem$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task_sem.c
	@echo generating preprocess file of k_task_sem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_task_sem$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_task_sem.c"

$(IntermediateDirectory)/core_k_tick$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_tick.c  
	@echo compiling k_tick.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_tick.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_tick$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_tick$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_tick$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_tick$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_tick.c
	@echo generating preprocess file of k_tick.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_tick$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_tick.c"

$(IntermediateDirectory)/core_k_time$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_time.c  
	@echo compiling k_time.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_time.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_time$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_time$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_time$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_time$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_time.c
	@echo generating preprocess file of k_time.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_time$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_time.c"

$(IntermediateDirectory)/core_k_timer$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_timer.c  
	@echo compiling k_timer.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_timer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_timer$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_timer.c
	@echo generating preprocess file of k_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_timer$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_timer.c"

$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_workqueue.c  
	@echo compiling k_workqueue.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_workqueue.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_workqueue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_workqueue$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_workqueue.c
	@echo generating preprocess file of k_workqueue.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_workqueue$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/core/k_workqueue.c"

$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_impl.c  
	@echo compiling hook_impl.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_impl.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_hook_impl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_hook_impl$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_impl.c
	@echo generating preprocess file of hook_impl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_hook_impl$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_impl.c"

$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_weak.c  
	@echo compiling hook_weak.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_weak.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_hook_weak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_hook_weak$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_weak.c
	@echo generating preprocess file of hook_weak.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_hook_weak$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/hook_weak.c"

$(IntermediateDirectory)/driver_systick$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/systick.c  
	@echo compiling systick.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/systick.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_systick$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_systick$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_systick$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_systick$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/systick.c
	@echo generating preprocess file of systick.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_systick$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/systick.c"

$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/yoc_impl.c  
	@echo compiling yoc_impl.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/yoc_impl.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_yoc_impl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_yoc_impl$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/yoc_impl.c
	@echo generating preprocess file of yoc_impl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_yoc_impl$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/driver/yoc_impl.c"

$(IntermediateDirectory)/riscv_cpu_impl$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/cpu_impl.c  
	@echo compiling cpu_impl.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/cpu_impl.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/riscv_cpu_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/riscv_cpu_impl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/riscv_cpu_impl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/riscv_cpu_impl$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/cpu_impl.c
	@echo generating preprocess file of cpu_impl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/riscv_cpu_impl$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/cpu_impl.c"

$(IntermediateDirectory)/riscv_csky_sched$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/csky_sched.c  
	@echo compiling csky_sched.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/csky_sched.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/riscv_csky_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/riscv_csky_sched$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/riscv_csky_sched$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/riscv_csky_sched$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/csky_sched.c
	@echo generating preprocess file of csky_sched.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/riscv_csky_sched$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/csky_sched.c"

$(IntermediateDirectory)/riscv_port_c$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_c.c  
	@echo compiling port_c.c...
	@$(CC) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_c.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/riscv_port_c$(ObjectSuffix) -MF$(IntermediateDirectory)/riscv_port_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/riscv_port_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/riscv_port_c$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_c.c
	@echo generating preprocess file of port_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/riscv_port_c$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_c.c"

$(IntermediateDirectory)/riscv_port_s$(ObjectSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_s.S  
	@echo assembling port_s.S...
	@$(AS) $(SourceSwitch) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_s.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/riscv_port_s$(ObjectSuffix) -MF$(IntermediateDirectory)/riscv_port_s$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/riscv_port_s$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/riscv_port_s$(PreprocessSuffix): E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_s.S
	@echo generating preprocess file of port_s.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/riscv_port_s$(PreprocessSuffix) "E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/csi_kernel/rhino/arch/riscv/port_s.S"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	@echo Cleaning target...
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) example_proj_jiayi.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex

