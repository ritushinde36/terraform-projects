locals {
    user_data_path = "${path.module}/user_data"
    sns_topic_name_unique_name = "${var.sns_topic_name}-${random_integer.rand_int.id}"
}