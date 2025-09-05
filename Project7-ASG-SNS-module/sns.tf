module "sns" {
    source = "./modules/sns-module"
    sns_topic_name = local.sns_topic_name_unique_name
    receiver_email_address = var.receiver_email_address
}