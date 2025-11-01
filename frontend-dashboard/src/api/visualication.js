import request from "@/utils/request";

// 获取可视化数据
export const getVisualizationData = () => {
  return request.get("/api/visualization-configs/active", {
    headers: {
      "X-API-KEY": "super-secret-visualization-key",
    },
  });
};
