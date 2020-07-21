.PHONY: clean All

All:
	@echo "----------Building project:[ zhixintongde - BuildSet ]----------"
	@
	@make -f "zhixintongde.mk" MakeIntermediateDirs && make -f "zhixintongde.mk" -j 4
	@echo Executing Post Build commands ...
	@export CDKPath="D:/software/C-Sky/CDK" ProjectPath="E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/ASH067476_Code/zhixintongde" && E:/Documents/GitHub/ZhixinTongde_WJ100/CDK_Projects/ASH067476_Code/zhixintongde/utilities/aft_build.sh
	@echo Done

clean:
	@echo "----------Cleaning project:[ zhixintongde - BuildSet ]----------"
	@make -f  "zhixintongde.mk" clean
