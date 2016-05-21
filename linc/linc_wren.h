#ifndef _LINC_WREN_H_
#define _LINC_WREN_H_
    
// #include "../lib/____"

#include <hxcpp.h>

extern "C" {
#include <../lib/wren/src/include/wren.h>
}

namespace linc {

    namespace wren {

        extern WrenVM* newVM(Dynamic _config);
        extern ::String getSlotString(WrenVM* vm, int slot);

    } //wren

} //linc

#endif //_LINC_WREN_H_
