# $log_path = 'optical-isar'
# $data_folder = 'optical-isar'
# $dataset_name = 'Optical_ISAR'
# $source = o
# $target = i

# CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/adda.py data/$data_folder -d $dataset_name -s $source -t $target --arch resnet50 --epochs 10 --seed 1 --log logs/adda/$log_path
# CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/adda.py data/optical-isar -d Optical_ISAR -s o -t i --arch resnet50 --epochs 5 --seed 1 --log logs/adda/optical-isar
CUDA_VISIBLE_DEVICES=0 python examples/domain_adaptation/image_classification/mdd.py data/optical-isar -d Optical_ISAR -s o -t i --arch resnet50 --epochs 10 --batch-size 32 --iters-per-epoch 100 --print-freq 10 --log logs/mdd/optical-isar