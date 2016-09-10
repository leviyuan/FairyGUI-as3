package fairygui
{
	public class BindingItem
	{
		private var _owner:GObject;
		private var _target:GObject;
		private var _property:String;
		private var _flag:String;
		
		
		public function BindingItem(owner:GObject)
		{
			_owner = owner;
		}
		
		final public function get owner():GObject
		{
			return _owner;
		}
		
		public function set target(value:GObject):void
		{
			_target = value;
		}
		
		final public function get target():GObject
		{
			return _target;
		}
		
		final public function get property():String
		{
			return _property;
		}
		
		final public function set property(value:String):void
		{
			_property = value;
		}
		
		final public function get flag():String
		{
			return _flag;
		}
		
		final public function set flag(value:String):void
		{
			_flag = value;
		}
	}
}