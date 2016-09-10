package fairygui
{
	public class Bindings
	{
		private var _owner:GObject;
		private var _items:Vector.<BindingItem>;
		
		public function Bindings(owner:GObject)
		{
			_owner = owner;
			_items = new Vector.<BindingItem>();
		}
		
		public function add(target:GObject, property:String, flag:String):void
		{
			for each(var item:BindingItem in _items)
			{
				if(item.target == target && item.property == property)
				{
					item.flag = flag;
					return;
				}
			}
			
			var newItem:BindingItem = new BindingItem(_owner);
			newItem.target = target;
			newItem.property = property;
			newItem.flag = flag;
			_items.push(newItem);
		}
		
		public function remove(target:GObject, property:String):void
		{
			var cnt:int = _items.length;
			var i:int = 0;
			while (i < cnt)
			{
				var item:BindingItem = _items[i];
				if(item.target == target && item.property == property)
				{
					_items.splice(i,1);
					break;
				}
			}
		}
		
		public function setup(xml:XML):void
		{
			var col:XMLList = xml.binding;
			var targetId:String;
			var target:GObject;
			for each(var cxml:XML in col)
			{
				targetId = cxml.@target;
				if(_owner.parent)
				{
					if(targetId)
						target = _owner.parent.getChildById(targetId);
					else
						target = _owner.parent;
				}
				else
				{ 
					//call from component construction
					target = GComponent(_owner).getChildById(targetId);
				}
				
				if(target)
					add(target, cxml.@property, cxml.@flag);
			}
		}
		
		public function dispose():void
		{
			
		}
	}
}