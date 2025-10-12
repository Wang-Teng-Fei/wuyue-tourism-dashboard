import { globalIgnores } from 'eslint/config'
import {
  defineConfigWithVueTs,
  vueTsConfigs,
} from '@vue/eslint-config-typescript'
import pluginVue from 'eslint-plugin-vue'

export default defineConfigWithVueTs(
  {
    name: 'app/files-to-lint',
    files: ['**/*.{ts,mts,tsx,vue}'],
  },

  globalIgnores(['**/dist/**', '**/dist-ssr/**', '**/coverage/**']),

  pluginVue.configs['flat/essential'],
  vueTsConfigs.recommended,

  // 完全移除格式化相关的规则，只保留代码质量检查
  {
    rules: {
      // 可以保留一些代码质量相关的规则，比如：
      'vue/no-unused-vars': 'error',
      'vue/no-mutating-props': 'error',

      // 但移除所有格式化相关的规则
      // 'vue/max-attributes-per-line': 'off',
      // 'vue/first-attribute-linebreak': 'off',
    },
  },
)
