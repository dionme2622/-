#version 330 core

layout (location = 0) in vec3 in_Position;
layout (location = 1) in vec3 vNormal;

out vec3 FragPos; //--- ��ü�� ��ġ���� �����׸�Ʈ ���̴��� ������.
out vec3 Normal;

uniform mat4 modelMatrix;
uniform mat4 viewTransform;
uniform mat4 projectionTransform;
uniform mat3 normalMatrix;

void main()
{
	gl_Position = projectionTransform * viewTransform * modelMatrix * vec4(in_Position, 1.f);

	FragPos = vec3(modelMatrix * vec4(in_Position, 1.0));		//--- ��ü�� ���� ���� ����� �����׸�Ʈ ���̴����� �Ѵ�. 
																//--- ���� ��������� �ִ� ���ؽ� ���� �����׸�Ʈ ���̴��� ������.
	Normal = normalMatrix * vNormal;							//--- ��ְ��� �����׸�Ʈ ���̴��� ������
}