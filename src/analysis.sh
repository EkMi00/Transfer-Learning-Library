$log_path = 'DomainNetqtor'
$data_folder = 'domainnet'
$dataset_name = 'DomainNet'
$source = q
$target = r

CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/adda.py data/$data_folder -d Office31 -s $source -t $target --arch resnet50 --pretrain logs/adda/$log_path/checkpoints/best.pth --phase analysis --seed 1 --log logs/adda/$log_path
