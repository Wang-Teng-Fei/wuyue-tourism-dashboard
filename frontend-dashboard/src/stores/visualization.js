import { ref, computed } from "vue";
import { defineStore } from "pinia";
import { getVisualizationData } from "@/api/visualication";

export const useVisualizationStore = defineStore("visualization", () => {
  // 可视化数据
  const visualizationData = ref({});

  const requestLock = ref(false);
  // 获取可视化数据
  const fetchVisualizationData = async () => {
    try {
      // 锁检查
      if (requestLock.value) return;

      console.log("开始请求数据...");
      requestLock.value = true;

      const res = await getVisualizationData();
      visualizationData.value = res.data;

      // 解析 config_json
      let configJson =
        typeof visualizationData.value.config_json === "string"
          ? JSON.parse(visualizationData.value.config_json)
          : visualizationData.value.config_json ?? {};

      // 默认边框
      const borderColor =
        typeof configJson.borderColor === "string"
          ? JSON.parse(configJson.borderColor.replace(/'/g, '"'))
          : configJson.borderColor ?? ["#4fd2dd", "#235fa7"];

      // 默认动画时间
      const echartsAnimationTime =
        Number(configJson.echartsAnimationTime) || 1500;

      // 默认颜色数组
      const echartsWuYueColor =
        typeof configJson.echartsWuYueColor === "string"
          ? JSON.parse(configJson.echartsWuYueColor.replace(/'/g, '"'))
          : configJson.echartsWuYueColor ?? [];

      // 合并默认值
      configJson = {
        ...configJson,
        borderColor,
        echartsAnimationTime,
        echartsWuYueColor,
      };

      visualizationData.value.config_json = configJson;
    } catch (error) {
      alert("请求失败:", error?.response?.data?.message);
    } finally {
      // 确保无论如何都解锁
      requestLock.value = false;
    }
  };

  return {
    visualizationData,
    fetchVisualizationData,
  };
});
