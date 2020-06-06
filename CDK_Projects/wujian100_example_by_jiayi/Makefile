.PHONY: clean All

All:
	@echo "----------Building project:[ example_proj_jiayi - BuildSet ]----------"
	@cd "example_proj_jiayi" && make -f "example_proj_jiayi.mk" clean_internal 
	@
	@cd "example_proj_jiayi" && make -f "example_proj_jiayi.mk" MakeIntermediateDirs && make -f "example_proj_jiayi.mk" -j 4
	@echo Executing Post Build commands ...
	@cd "example_proj_jiayi" && export CDKPath="D:/software/C-Sky/CDK" ProjectPath="E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi" && E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/wujian100_example_by_jiayi/example_proj_jiayi/utilities/aft_build.sh
	@echo Done

clean:
	@echo "----------Cleaning project:[ example_proj_jiayi - BuildSet ]----------"
	@cd "example_proj_jiayi" && make -f  "example_proj_jiayi.mk" clean
