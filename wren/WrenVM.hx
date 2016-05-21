package wren;

@:include('linc_wren.h')
@:native("WrenVM")
extern private class Wren_VM {}
typedef WrenVM = cpp.Pointer<Wren_VM>;

