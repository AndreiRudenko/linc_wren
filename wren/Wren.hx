package wren;

import wren.WrenVM;
import wren.WrenValue;

@:keep
@:include('linc_wren.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('wren'))
#end
extern class Wren {

    @:native('linc::wren::newVM')
    static function newVM(?config:WrenConfiguration) : WrenVM;

    @:native('wrenFreeVM')
    static function freeVM(vm:WrenVM) : Void;

    @:native('wrenCollectGarbage')
    static function collectGarbage(vm:WrenVM) : Void;

    @:native('wrenInterpret')
    static function interpret(vm:WrenVM, source:String) : WrenInterpretResult;

    @:native('wrenMakeCallHandle')
    static function makeCallHandle(vm:WrenVM, signature:String) : WrenValue;

    @:native('wrenCall')
    static function call(vm:WrenVM, method:WrenValue) : WrenInterpretResult;

    @:native('wrenReleaseValue')
    static function releaseValue(vm:WrenVM, value:WrenValue) : Void;

    @:native('wrenGetSlotCount')
    static function getSlotCount(vm:WrenVM) : Int;

    @:native('wrenEnsureSlots')
    static function ensureSlots(vm:WrenVM, numSlots:Int) : Void;

    @:native('wrenGetSlotType')
    static function getSlotType(vm:WrenVM, slot:Int) : WrenType;

    @:native('wrenGetSlotBool')
    static function getSlotBool(vm:WrenVM, slot:Int) : Bool;

    @:native('wrenGetSlotBytes')
    static function getSlotBytes(vm:WrenVM, slot:Int, length:Int) : Bool;

    @:native('wrenGetSlotDouble')
    static function getSlotDouble(vm:WrenVM, slot:Int) : Float;

    @:native('wrenGetSlotForeign')
    static function getSlotForeign(vm:WrenVM, slot:Int) : Void;

    @:native('linc::wren::getSlotString')
    static function getSlotString(vm:WrenVM, slot:Int) : String;

    @:native('wrenGetSlotValue')
    static function getSlotValue(vm:WrenVM, slot:Int) : WrenValue;

    @:native('wrenSetSlotBool')
    static function setSlotBool(vm:WrenVM, slot:Int, value:Bool) : Void;

    @:native('wrenSetSlotBytes')
    static function setSlotBytes(vm:WrenVM, slot:Int, bytes:String, length:UInt) : Void;

    @:native('wrenSetSlotDouble')
    static function setSlotDouble(vm:WrenVM, slot:Int, value:Float) : Void;

    @:native('wrenSetSlotNewForeign')
    static function setSlotNewForeign(vm:WrenVM, slot:Int, classSlot:Int, size:UInt) : Void;

    @:native('wrenSetSlotNewList')
    static function setSlotNewList(vm:WrenVM, slot:Int) : Void;

    @:native('wrenSetSlotNull')
    static function setSlotNull(vm:WrenVM, slot:Int) : Void;

    @:native('wrenSetSlotString')
    static function setSlotString(vm:WrenVM, slot:Int, text:String) : Void;

    @:native('wrenSetSlotValue')
    static function setSlotValue(vm:WrenVM, slot:Int, value:WrenValue) : Void;

    @:native('wrenInsertInList')
    static function insertInList(vm:WrenVM, listSlot:Int, index:Int, elementSlot:Int) : Void;

    @:native('wrenGetVariable')
    static function getVariable(vm:WrenVM, module:String, name:String, slot:Int) : Void;

} //Wren

typedef WrenConfiguration = {
    @:optional var initialHeapSize : UInt;
    @:optional var minHeapSize : UInt;
    @:optional var heapGrowthPercent : Int;
} //WrenConfiguration

@:enum
abstract WrenInterpretResult(Int)
from Int to Int {
    var WREN_RESULT_SUCCESS        = 0;
    var WREN_RESULT_COMPILE_ERROR  = 1;
    var WREN_RESULT_RUNTIME_ERROR  = 2;
} //WrenInterpretResult

@:enum
abstract WrenType(Int)
from Int to Int {
    var WREN_TYPE_BOOL        = 0;
    var WREN_TYPE_NUM         = 1;
    var WREN_TYPE_FOREIGN     = 2;
    var WREN_TYPE_LIST        = 3;
    var WREN_TYPE_NULL        = 4;
    var WREN_TYPE_STRING      = 5;
    var WREN_TYPE_UNKNOWN     = 6;
} //WrenType
