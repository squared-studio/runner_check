#!/bin/bash
echo "$(date)" > temp
echo "" >> temp
echo "Runner Name      : $1" >> temp
echo "Host Name        : $(hostname)" >> temp
echo "User Name        : $(whoami)" >> temp
echo "Operating System : $(uname -s)" >> temp
echo "Architecture     : $(uname -m)" >> temp
echo "Processor        : $(awk -F': ' '/model name/{print $2;exit}' /proc/cpuinfo)" >> temp
echo "RAM              : $(awk '/MemTotal/ { printf "%.1f\n", $2/1024/1024 }' /proc/meminfo)GB" >> temp
echo "" >> temp
echo "TOOLS INSTALLED:" >> temp

# COCOTB
    which cocotb-config && \
    echo -e "\033[1;32mcocotb\033[0m" >> temp || \
    echo -e "\033[1;31mcocotb\033[0m" >> temp

# GCC
    which GCC && \
    echo -e "\033[1;32mGNU Compiler Collections\033[0m" >> temp || \
    echo -e "\033[1;31mGNU Compiler Collections\033[0m" >> temp

# GNU Make
    which make && \
    echo -e "\033[1;32mGNU Make\033[0m" >> temp || \
    echo -e "\033[1;31mGNU Make\033[0m" >> temp

# Icarus Verilog
    which iverilog && \
    echo -e "\033[1;32mIcarus Verilog\033[0m" >> temp || \
    echo -e "\033[1;31mIcarus Verilog\033[0m" >> temp

# Python
    echo "print('Hi')" > test.py
    (python3 test.py && \
    echo -e "\033[1;32mPython3\033[0m" >> temp) || \
    (python test.py && \
    echo -e "\033[1;32mPython\033[0m" >> temp) || \
    echo -e "\033[1;31mPython\033[0m" >> temp
    rm -rf test.py

# Verilator
    which vsim && \
    echo -e "\033[1;32mIntel Questa\033[0m" >> temp || \
    echo -e "\033[1;31mIntel Questa\033[0m" >> temp

# Verilator
    which verilator && \
    echo -e "\033[1;32mVerilator\033[0m" >> temp || \
    echo -e "\033[1;31mVerilator\033[0m" >> temp

# Vivado
    which vivado && \
    echo -e "\033[1;32mXilinx Vivado\033[0m" >> temp || \
    echo -e "\033[1;31mXilinx Vivado\033[0m" >> temp

clear
cat temp
rm -rf temp


