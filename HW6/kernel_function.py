# Cifar
from tensorflow.python.platform import flags
import pickle
import saab_compact as saab
import numpy as np
flags.DEFINE_string("output_path", None, "The output dir to save params")
flags.DEFINE_string("use_classes", "0-9", "Supported format: 0,1,5-9")
flags.DEFINE_string("kernel_sizes", "5,5", "Kernels size for each stage. Format: '3,3'")
flags.DEFINE_string("num_kernels", None, "Num of kernels for each stage. Format: '4,10'")
flags.DEFINE_float("energy_percent", None, "Energy to be preserved in each stage")
flags.DEFINE_integer("use_num_images", -1, "Num of images used for training")
FLAGS = flags.FLAGS

def kernal(train_images, train_labels, test_images, test_labels, class_list, num_kernels = None, kernel_sizes = None,stride=4):
    # read data
#    train_images, train_labels, test_images, test_labels, class_list = data.import_data(FLAGS.use_classes)
#    test_images, test_labels,train_images, train_labels,  class_list = data.import_data(FLAGS.use_classes)
    print('Training image size:', train_images.shape)
    print('Testing_image size:', test_images.shape)
    print ('Training images.dtype ', train_images.dtype)
    if num_kernels is not None:
        num_kernels = num_kernels
    if kernel_sizes is not None:
        kernel_sizes = kernel_sizes
    kernel_sizes = saab.parse_list_string(kernel_sizes)
    if num_kernels:
        num_kernels = saab.parse_list_string(num_kernels)
    else:
        num_kernels = None

    energy_percent = None
    use_num_images = -1
    print('Parameters:')
    print('use_classes:', class_list)
    print('Kernel_sizes:', kernel_sizes)
    print('Number_kernels:', num_kernels)
    print('Energy_percent:', energy_percent)
    print('Number_use_images:', use_num_images)
    print('Stride:', stride)
    #train_images=np.moveaxis(train_images, 3, 1)
    pca_params = saab.multi_Saab_transform(train_images, train_labels,
                                           kernel_sizes=kernel_sizes,
                                           num_kernels=num_kernels,
                                           energy_percent=energy_percent,
                                           use_num_images=use_num_images,
                                           use_classes=class_list,
                                           stride=stride)
    # save data

    fw = open('pca_params_compact.pkl', 'wb')

    pickle.dump(pca_params, fw)

    fw.close()



    # load data

    fr = open('pca_params_compact.pkl', 'rb')

    data1 = pickle.load(fr)

    # print(data1)

    fr.close()
    return pca_params


















