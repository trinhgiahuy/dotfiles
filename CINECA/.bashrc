# .bashrc

# Disable XON/XOFF flow control for C-s in 
stty -ixon


#intel_module=('autoload ' 'onempi' 'intelmpi')
#load_module=('autoload' 'nvhpc')

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$HOME/tools/nvim-linux64/bin:$PATH
#echo "Loading modules: ${load_module[@]}"
#module load ${load_module[@]}



export PATH=/g100/home/usertrain/a08tra41/tmpi:/g100/home/usertrain/a08tra41/tmpi:/g100/home/usertrain/a08tra41/tools/nvim-linux64/bin:/cineca/bin:/g100_work/PROJECTS/spack/v0.17/prod/0.17.1/install/0.17/linux-centos8-skylake_avx512/gcc-8.4.1/cuda-11.5.0-ktwkkqqhebhe64r4ial5g632vefweb4i/bin:/g100_work/PROJECTS/spack/v0.17/prod/0.17.1/install/0.17/linux-centos8-cascadelake/gcc-10.2.0/openmpi-4.1.1-ov3ei7jkweiidsuwh525b4fjg3wpky6j/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/mpi/latest/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/compiler/latest/linux/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/compiler/latest/linux/bin/intel64:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/dev-utilities/latest/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/dpcpp-ct/latest/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/advisor/latest/fga/fgt/linux/pin/intel64/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/vpl/latest/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/itac/latest/bin:/cineca/prod/opt/compilers/intel/oneapi-2022/binary/debugger/latest/gdb/intel64/bin:/g100/home/usertrain/a08tra41/tools/nvim-linux64/bin:/cineca/bin:/cineca/prod/opt/tools/cintools/1.0/none/bin:/cineca/prod/opt/environment/module/4.7.0/none/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ddn/ime/bin:/opt/slurm/current/bin:/opt/slurm/current/sbin:/g100/home/usertrain/a08tra41/.local/bin:/g100/home/usertrain/a08tra41/bin:/opt/ddn/ime/bin:/opt/slurm/current/bin:/opt/slurm/current/sbin:/g100/home/usertrain/a08tra41/.local/bin:/g100/home/usertrain/a08tra41/bin

sallocate(){

	salloc -N "$1" -A tra23_sumsch23 -p g100_usr_prod
}

sallocate_gpu(){
	salloc -N "$1" --gres=gpu:1 -A tra23_sumsch23 -p g100_usr_interactive -t "08:00:00"
	
	
	# Extract the computing nodes name and ssh to it
	nodeName=$(squeue --me | awk 'NR > 1 {print $8}')
}

nodeName=$(squeue --me | awk 'NR > 1 {print $8}')
if [[ -n $nodeName ]];then 
	#ssh $nodeName
	echo "[LOG] There is an compute nodename ${nodeName}"
else
	echo "[LOG] There is no computing nodes currently"
fi

tmux source-file ~/tmux.conf
alias ts="tmux source-file tmux.conf"
tmux-a(){
	tmux attach-session -t $1
}

test(){
	echo "WHY"
}


getNodeID(){
	nodeName=$(squeue --me | awk 'NR > 1 {print $8}')
	echo $nodeName
}

cudaCompile(){
	nvcc -arch=sm_70 -o "$1.x" $1
}

# Overwrite C-A in tmux to start the beginng-of-line in cli
#set -o vi
    #bind '\C-q:beginning-of-line'


hd(){
  cd /g100/home/usertrain/a08tra41
}

alias sb="source /g100/home/usertrain/a08tra41/.bashrc"
alias eb="vi /g100/home/usertrain/a08tra41/.bashrc"
alias wsq="watch -n 1 squeue --me"
alias wd="hd && cd 2023/summer-school/hpc_app_profiling/2023"


alias vi=vim
alias load_sycl="source /g100_work/tra23_sumsch23/activate_Intel_OneAPI_SYCL.sh"

#Add file (1) to my github 
afgh(){
    tmpDir=$(pwd)
    #hd
    #cd git/ex1_1/profile
    gitdir="/g100/home/usertrain/a08tra41/git/ex1_1/profile"
    cp $1 $gitdir
    #msg="Add profiling execute files"
    cd $gitdir
    git add .
    git commit -m "add execute files"
    git push
    cd $tmpDir
}

#Add dir ($1) to my github
adgh(){
    tmpDir=$(pwd)
    #hd
    #cd git/ex1_1/profile
    gitdir="/g100/home/usertrain/a08tra41/git/ex1_1/profile"
    cp -r $1 $gitdir
    #msg="Add profiling execute files"
    cd $gitdir
    git add .
    git commit -m "add execute files"
    git push
    cd $tmpDir
}
