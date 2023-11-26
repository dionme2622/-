#version 330 core

in vec3 FragPos;			
in vec3 Normal;				

out vec4 FragColor;			

uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 objectColor;

uniform vec3 viewPos;

void main()
{
	float ambientLight = 0.3;

	vec3 ambient = ambientLight * lightColor;
	vec3 nomalVector = normalize (Normal);
	vec3 lightDir = normalize(lightPos - FragPos);

	float diffuseLight = max(dot(nomalVector, lightDir), 0.0);
	vec3 diffuse = diffuseLight * lightColor;

	int shininess = 32; //--- ���� ���
	vec3 viewDir = normalize(viewPos - FragPos); //--- �������� ����
	vec3 reflectDir = reflect(-lightDir, nomalVector); //--- �ݻ� ����: reflect �Լ� - �Ի� ������ �ݻ� ���� ���
	float specularLight = max (dot (viewDir, reflectDir), 0.0); //--- V�� R�� ���������� ���� ����: ���� ����
	specularLight = pow(specularLight, shininess); //--- shininess ���� ���־� ���̶���Ʈ�� ������ش�.
	vec3 specular = specularLight * lightColor; //--- �ſ� �ݻ� ����: �ſ�ݻ簪 * �������
	vec3 result = (ambient + diffuse + specular) * objectColor; //--- ���� ���� ������ �ȼ� ����: (�ֺ�+����ݻ�+�ſ�ݻ�����)*��ü ����

	FragColor = vec4(result, 1.0);
}