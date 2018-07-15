# Sketchup ǥ�� API �� ����ϱ� ���� sketchup.rb ������ ���Խ�Ų��
require 'sketchup.rb'
Sketchup.send_action "showRubyPanel:"

# Plug-in�� ����� �� �޴��� �߰�.
UI.menu("PlugIns").add_item("Report attributes") { 
	report	
}

def report
		index = 0
		Sketchup.active_model.entities.each { | entity |  
			attrdict = entity.attribute_dictionaries['materials']
			if attrdict == nil 
				UI.messagebox("There are no attributes")
			else
				attrdict.each { | key, value |   UI.messagebox key.to_s + '=' + value.to_s }
			end
			index = index + 1
			if index > 3
				break 
			end
		}
end