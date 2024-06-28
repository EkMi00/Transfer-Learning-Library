# $log_path = 'DomainNetqtor'
# $data_folder = 'domainnet'
# $dataset_name = 'DomainNet'
# $source = q
# $target = r

# CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/adda.py data/$data_folder -d DomainNet -s $source -t $target --arch resnet50 --pretrain logs/adda/$log_path/checkpoints/best.pth --phase analysis --seed 1 --log logs/adda/$log_path
# CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/adda.py data/optical-isar -d Optical_ISAR -s o -t i --arch resnet50 --pretrain logs/adda/optical-isar/checkpoints/best.pth --phase analysis --seed 1 --log logs/adda/optical-isar
CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/mdd.py data/optical-isar -d Optical_ISAR -s o -t i --arch resnet50 --epochs 5 --pretrain logs/mdd/optical-isar/checkpoints/latest.pth --phase analysis --seed 1 --log logs/mdd/optical-isar
