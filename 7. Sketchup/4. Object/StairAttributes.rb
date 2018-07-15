# Sketchup ǥ�� API �� ����ϱ� ���� sketchup.rb ������ ���Խ�Ų��
require 'sketchup.rb'
Sketchup.send_action "showRubyPanel:"
# Plug-in�� ����� �� �޴��� �߰�.

UI.menu("PlugIns").add_item("Draw stair with attributes") { 
	UI.messagebox("I'm about to draw spiral stairs!")
	draw_stairs
	
}

def draw_stairs  
	# ������ ��� ������ ���� �Ķ���͸� ����
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

	# ���� �ڵ带 �ݺ� ���� ���� for loop ���� ���. 1���� stairs Ƚ������ �ݺ�
	for step in 1..stairs        
		# ����� �� �ڳʸ� ��� 
		x1 = 0    
		y1 = 0    
		x2 = width    
		y2 = run 
		z = rise * step        

		# ������ ����� ����� ���� �̵� * ȸ�� ��ȯ����� ����
		point = Geom::Point3d.new radius, 0, 0
		tMove = Geom::Transformation.new point
		point = [0, 0, 0]
		vector = [0, 0, 1]
		angle = angle_interval * step
		tRotation = Geom::Transformation.rotation point, vector, angle
		transformation = tRotation * tMove

		# ���� ��ǥ���� �̿��� ����� �̷�� �� ����Ʈ�� ����
		pt1 = transformation * [x1, y1, z]    
		pt2 = transformation * [x2, y1, z]    
		pt3 = transformation * [x2, y2, z]    
		pt4 = transformation * [x1, y2, z]    

		# ��� �� ����
		group = entities.add_group
		new_face = group.entities.add_face pt1, pt2, pt3, pt4  			
		new_face.material = Sketchup::Color.new(step % 256, 100, 0)	# ���� ����. 
							# ��������� 0-255�̹Ƿ� ������ ������ %�� �����.
		new_face.pushpull thickness		# ��� �β� ����
		
		create_if_nil = true 
		attrdict = group.attribute_dictionary "materials", create_if_nil 
		attrdict["no"] = step 
		attrdict["material"] = "wood-steel"
		attrdict["company"] = "woodproduct.com"
	end
end
