resource "aws_iam_role" "sinatra-app-instance-role" {
  name = "sinatra-app-instance-role"
  path = "/"
  assume_role_policy = "${data.aws_iam_policy_document.sinatra-app-instance-policy.json}"
}

data "aws_iam_policy_document" "sinatra-app-instance-policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "sinatra-app-instance-role-attachment" {
  role = "${aws_iam_role.sinatra-app-instance-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "sinatra-app-instance-profile" {
  name = "sinatra-app-instance-profile"
  path = "/"
  role = "${aws_iam_role.sinatra-app-instance-role.id}"
}
