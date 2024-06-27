$log_path = 'DomainNetqtor'
$data_folder = 'domainnet'
$dataset_name = 'DomainNet'
$source = q
$target = r

CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/adda.py data/$data_folder -d $dataset_name -s $source -t $target --arch resnet50 --epochs 10 --seed 1 --log logs/adda/$log_path
