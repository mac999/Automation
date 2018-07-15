# Sketchup ǥ�� API �� ����ϱ� ���� sketchup.rb ������ ���Խ�Ų��
require 'sketchup.rb'
Sketchup.send_action "showRubyPanel:"
# Plug-in�� ����� �� �޴��� �߰�.
UI.menu("PlugIns").add_item("Draw spiral stairs") { 
draw_stairs
}

def draw_stairs  
# ������ �����ϴ� �� ��ü�� ȹ�� 
model = Sketchup.active_model  
entities = model.entities  
# ����� �����ϴ� ����Ʈ�� ��ǥ���� ����
pt1 = [0, 0, 0]  
pt2 = [9, 0, 0]  
pt3 = [9, 9, 0]  
pt4 = [0, 9, 0]    
# ����Ʈ��� ������ �� �ϳ��� ����
new_face = entities.add_face pt1, pt2, pt3, pt4
end

