module "qa" {
source = "./modules/blog"

project_id = var.project_id
region = var.region


app_name        = "qa-blog"
networks_name   = "qa"

}


module "stagging" {
source = "./modules/blog"

project_id = var.project_id
region = var.region


app_name        = "stagging-blog"
networks_name   = "stagging"

}


module "prod" {
source = "./modules/blog"

project_id = var.project_id
region = var.region


app_name        = "prod-blog"
networks_name   = "prod"

}