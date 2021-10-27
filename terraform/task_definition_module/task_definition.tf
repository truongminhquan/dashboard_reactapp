data "template_file" "main_reactapp_task_definition_template" {
  # template = file("task_definition_template/reactapp_task_definition.json")
  template = file(var.TASK_DEFINITION_TEMPLATE_PATH)

  vars = {
    REPOSITORY_URL = var.REPOSITORY_URL
    IMAGE_TAG = var.IMAGE_TAG
  }
}

resource "aws_ecs_task_definition" "main_reactapp_task_definition" {
  family                = "reactapp"
  container_definitions = data.template_file.main_reactapp_task_definition_template.rendered

}