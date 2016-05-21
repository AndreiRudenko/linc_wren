import wren.Wren;
import wren.WrenVM;
import wren.WrenValue;

class Test {

    static function main() {
    	var vm:WrenVM = Wren.newVM();

    	var file:String = sys.io.File.getContent("script.wren");
		Wren.interpret(vm, file);

		Wren.ensureSlots(vm, 1);
		Wren.getVariable(vm, "main", "Call", 0);
		var callClass:WrenValue = Wren.getSlotValue(vm, 0);

		var noParams:WrenValue = Wren.makeCallHandle(vm, "noParams");
		var zero:WrenValue = Wren.makeCallHandle(vm, "zero()");
		var one:WrenValue = Wren.makeCallHandle(vm, "one(_)");

		Wren.ensureSlots(vm, 1);
		Wren.setSlotValue(vm, 0, callClass);
		Wren.call(vm, noParams);
		
		Wren.ensureSlots(vm, 1);
		Wren.setSlotValue(vm, 0, callClass);
		Wren.call(vm, zero);
		
		Wren.ensureSlots(vm, 2);
		Wren.setSlotValue(vm, 0, callClass);
		Wren.setSlotDouble(vm, 1, 1.0);
		Wren.call(vm, one);

		Wren.releaseValue(vm, callClass);
		Wren.releaseValue(vm, noParams);
		Wren.releaseValue(vm, zero);
		Wren.releaseValue(vm, one);

        Wren.freeVM(vm);
    }
    
}