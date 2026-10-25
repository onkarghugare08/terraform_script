# No attribute of the instance is referenced, but we want the bucket
# created only after the instance exists.
resource "aws_s3_bucket" "logs" {
  bucket_prefix = "terraweek-app-logs-"

  depends_on = [aws_instance.main]

  tags = {
    Name = "TerraWeek-Logs"
  }
}