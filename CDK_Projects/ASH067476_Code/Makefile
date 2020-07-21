.PHONY: clean All

All:
	@echo "----------Building project:[ zhixintongde - BuildSet ]----------"
	@
	@cd "example_proj_jiayi" && make -f "zhixintongde.mk" MakeIntermediateDirs && make -f "zhixintongde.mk" -j 4
	@echo Executing Post Build commands ...
	@cd "example_proj_jiayi" && export CDKPath="D:/software/C-Sky/CDK" ProjectPath="E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/ASH067476_Code/example_proj_jiayi" && E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/ASH067476_Code/example_proj_jiayi/utilities/aft_build.sh
	@echo Done

clean:
	@echo "----------Cleaning project:[ zhixintongde - BuildSet ]----------"
	@cd "example_proj_jiayi" && make -f  "zhixintongde.mk" clean
