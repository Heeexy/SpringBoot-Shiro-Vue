import { hasPermission } from "@/utils/hasPermission";

export default {
    inserted: function(el, binding) {
        let { value, modifiers } = binding;
        // 通过|分割开的权限,满足任意一种即可. 此处可以自己拓展&来处理[且]的关系,
        // 更复杂的 &| 的关系可以 v-if="hasPerm('a:b') & .. | .." 来实现
        let keys =
            value && value.trim() !== ""
                ? value.split("|")
                : Object.keys(modifiers);
        if (keys && keys.length) {
            let hasAuth = keys.some(key => hasPermission(key));
            !hasAuth && el.parentNode.removeChild(el);
        }
    }
};
