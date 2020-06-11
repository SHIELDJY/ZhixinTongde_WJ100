.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_open-usart - BuildSet ]----------"
	@
	@make -f "wujian100_open-usart.mk" MakeIntermediateDirs && make -f "wujian100_open-usart.mk" -j 4
	@echo Executing Post Build commands ...
	@export CDKPath="D:/C-Sky/CDK" ProjectPath="C:/Users/Administrator/Desktop/wujian100_open-master/sdk/projects/examples/driver/usart/CDK" && "C:/Users/Administrator/Desktop/wujian100_open-master/sdk/projects/examples/driver/usart/CDK//../../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_open-usart - BuildSet ]----------"
	@make -f  "wujian100_open-usart.mk" clean
