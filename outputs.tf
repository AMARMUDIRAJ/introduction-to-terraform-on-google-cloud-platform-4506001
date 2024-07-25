output "qa_ip" {
    value = module.qa.public_ip
}

output "stagging_ip" {
    value = module.stagging.public_ip
}


output "prod_ip" {
    value = module.prod.public_ip
}