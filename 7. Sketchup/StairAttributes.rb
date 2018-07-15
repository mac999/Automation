# Sketchup ǥ�� API �� ����ϱ� ���� sketchup.rb ������ ���Խ�Ų��
require 'sketchup.rb'
Sketchup.send_action "showRubyPanel:"
# Plug-in�� ����� �� �޴��� �߰�.

UI.menu("PlugIns").add_item("Draw spiral stairs group and attributes") { 
	UI.messagebox("I'm about to draw spiral stairs!")
	draw_stairs 
}


def draw_stairs
	radius = 200
	angle_interval = 3.14159 / 30.0
	stairs = 255  
	rise = 8  
	run = 12  
	width = 100  
	thickness = 3
	# ������ �����ϴ� �� ��ü�� ȹ��
	model = Sketchup.active_model  
	entities = model.entities  

  
# ��� �� ����
		pt1 = Geom::Point3d.new radius, 0, 0
		pt1 = [0, 0, 0]
		pt2 = Geom::Point3d.new radius, 0, 0
		pt2 = [0, 10, 0]
		pt3 = Geom::Point3d.new radius, 0, 0
		pt3 = [10, 10, 0]
		pt4 = Geom::Point3d.new radius, 0, 0
		pt4 = [10, 0, 0]
	

		group = entities.add_group
		new_face = group.entities.add_face pt1, pt2, pt3, pt4  
			
new_face.material = Sketchup::Color.new(step % 256, 100, 0)	# ���� ����. 
# ��������� 0-255�̹Ƿ� ������ ������ %�� �����.
		new_face.pushpull 1 true		# ��� �β� ����

		# �Ӽ� ����
		group.set_attribute "stair_parameter", "radius", radius
		group.set_attribute "stair_parameter", "width", width
		group.set_attribute "stair_parameter", "thickness", thickness
		group.set_attribute "stair_parameter", "angle", angle
		group.set_attribute "material", "finish", "wood-fin-n0425"
		group.set_attribute "material", "core", "steel-n1005"
		group.set_attribute "material", "modulus", ""
end