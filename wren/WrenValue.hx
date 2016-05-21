package wren;

@:native("WrenValue")
@:include('linc_wren.h')
extern private class Wren_Value {}
typedef WrenValue = cpp.Pointer<Wren_Value>;
