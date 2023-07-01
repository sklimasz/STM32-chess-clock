################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/fatfs_sd.c \
../Core/Src/game.c \
../Core/Src/main.c \
../Core/Src/max7219_digits.c \
../Core/Src/stm32l0xx_hal_msp.c \
../Core/Src/stm32l0xx_it.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32l0xx.c 

OBJS += \
./Core/Src/fatfs_sd.o \
./Core/Src/game.o \
./Core/Src/main.o \
./Core/Src/max7219_digits.o \
./Core/Src/stm32l0xx_hal_msp.o \
./Core/Src/stm32l0xx_it.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32l0xx.o 

C_DEPS += \
./Core/Src/fatfs_sd.d \
./Core/Src/game.d \
./Core/Src/main.d \
./Core/Src/max7219_digits.d \
./Core/Src/stm32l0xx_hal_msp.d \
./Core/Src/stm32l0xx_it.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32l0xx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L073xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/fatfs_sd.cyclo ./Core/Src/fatfs_sd.d ./Core/Src/fatfs_sd.o ./Core/Src/fatfs_sd.su ./Core/Src/game.cyclo ./Core/Src/game.d ./Core/Src/game.o ./Core/Src/game.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/max7219_digits.cyclo ./Core/Src/max7219_digits.d ./Core/Src/max7219_digits.o ./Core/Src/max7219_digits.su ./Core/Src/stm32l0xx_hal_msp.cyclo ./Core/Src/stm32l0xx_hal_msp.d ./Core/Src/stm32l0xx_hal_msp.o ./Core/Src/stm32l0xx_hal_msp.su ./Core/Src/stm32l0xx_it.cyclo ./Core/Src/stm32l0xx_it.d ./Core/Src/stm32l0xx_it.o ./Core/Src/stm32l0xx_it.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32l0xx.cyclo ./Core/Src/system_stm32l0xx.d ./Core/Src/system_stm32l0xx.o ./Core/Src/system_stm32l0xx.su

.PHONY: clean-Core-2f-Src

