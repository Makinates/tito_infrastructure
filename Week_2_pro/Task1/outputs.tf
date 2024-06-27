output "codepipeline_url" {
  value = "https://console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.my_pipeline.name}/view?region=${var.aws_region}"
}
