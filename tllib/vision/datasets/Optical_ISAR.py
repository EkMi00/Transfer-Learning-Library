"""
@author: ekmi00
@contact: 
"""
from typing import Optional
import os
from .imagelist import ImageList
from ._util import download as download_data, check_exits


class Optical_ISAR(ImageList):
    """Optical_ISAR Dataset.

    Args:
        root (str): Root directory of dataset
        task (str): The task (domain) to create dataset. Choices include ``'i'``: isar, \
            and ``'o'``: optical.
        download (bool, optional): If true, downloads the dataset from the internet and puts it \
            in root directory. If dataset is already downloaded, it is not downloaded again.
        transform (callable, optional): A function/transform that  takes in an PIL image and returns a \
            transformed version. E.g, :class:`torchvision.transforms.RandomCrop`.
        target_transform (callable, optional): A function/transform that takes in the target and transforms it.

    Note: In `root`, there will exist following files;
        isar/
            bicycle/
                *.jpg
                ... 749 images
            car/
                ... 376 images
            truck/
                ... 749 images
        optical/
            bicycle/
                *.jpg
                ... 4180 images
            car/
                ... 10,965 images
            truck/
                ... 6221  images
        image_list/
            isar.txt
            optical.txt
    """
    download_list = []
    # download_list = [
    #     ("image_list", "image_list.zip", "https://cloud.tsinghua.edu.cn/f/2c1dd9fbcaa9455aa4ad/?dl=1"),
    #     ("amazon", "amazon.tgz", "https://cloud.tsinghua.edu.cn/f/ec12dfcddade43ab8101/?dl=1"),
    #     ("dslr", "dslr.tgz", "https://cloud.tsinghua.edu.cn/f/a41d818ae2f34da7bb32/?dl=1"),
    #     ("webcam", "webcam.tgz", "https://cloud.tsinghua.edu.cn/f/8a41009a166e4131adcd/?dl=1"),
    # ]
    image_list = {
        "i": "image_list/isar.txt",
        "o": "image_list/optical.txt",
    }
    CLASSES = ['bicycle', 'car', 'truck']

    def __init__(self, root: str, task: str, download: Optional[bool] = False, **kwargs):
        assert task in self.image_list
        data_list_file = os.path.join(root, self.image_list[task])

        if download:
            list(map(lambda args: download_data(root, *args), self.download_list))
        else:
            list(map(lambda file_name, _: check_exits(root, file_name), self.download_list))

        super(Optical_ISAR, self).__init__(root, Optical_ISAR.CLASSES, data_list_file=data_list_file, **kwargs)

    @classmethod
    def domains(cls):
        return list(cls.image_list.keys())