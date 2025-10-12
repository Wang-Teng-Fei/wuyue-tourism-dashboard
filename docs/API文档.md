---
title: 默认模块
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.30"

---

# 默认模块

Base URLs:

# Authentication

# 飞线图

## GET 获取飞线图列表

GET /api/flyline-charts/name

获取所有飞线图的名称和描述列表

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "中国飞线图",
      "description": "中国的全部飞线图"
    },
    {
      "id": 2,
      "name": "衡1山飞线图",
      "description": "衡山的飞线图"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|false|none||none|
|»» name|string|false|none|名称|none|
|»» description|string|false|none|描述|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 按名称查询飞线图

GET /api/flyline-charts/search/name

按名称查询飞线图

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|flyline_name|query|string| 否 |飞线图名称|
|Authorization|header|string| 否 |none|
|Accept|header|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "全国旅游流向5",
      "points": [
        {
          "name": "北京",
          "coordinate": [
            0.5,
            0.4
          ]
        },
        {
          "name": "上海",
          "coordinate": [
            0.7,
            0.5
          ]
        }
      ],
      "lines": [
        {
          "source": "北京",
          "target": "上海"
        }
      ],
      "description": "主要城市间游客流向",
      "main_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/kA6RDxEjmR9AuNPP6OBFlQ8bo0j4332mEDbvOZ7j.png",
      "sub_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
      "point_image_path": "http://www.wuyue-tourism-dashboard.com/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
      "extra_config": "{}",
      "created_at": "2025-09-27T05:56:25.000000Z",
      "updated_at": "2025-10-07T05:56:28.000000Z"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|false|none||none|
|»» name|string|false|none|名称|none|
|»» points|[object]|false|none|点位图|none|
|»»» name|string|true|none||none|
|»»» coordinate|[number]|true|none||none|
|»» lines|[object]|false|none|线性图|none|
|»»» source|string|false|none||none|
|»»» target|string|false|none||none|
|»» description|string|false|none|描述|none|
|»» main_image|string|false|none|主图|none|
|»» sub_image|string|false|none|附图|none|
|»» point_image_path|string|false|none||none|
|»» extra_config|string|false|none||none|
|»» created_at|string|false|none||none|
|»» updated_at|string|false|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取单个飞线图详情

GET /api/flyline-charts/{flyline_id}

获取所有单个飞线图的详情

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|flyline_id|path|integer| 是 |none|
|Authorization|header|string| 否 |none|
|Accept|header|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 1,
    "name": "全国旅游流向5",
    "points": [
      {
        "name": "北京",
        "coordinate": [
          0.5,
          0.4
        ]
      },
      {
        "name": "上海",
        "coordinate": [
          0.7,
          0.5
        ]
      }
    ],
    "lines": [
      {
        "source": "北京",
        "target": "上海"
      }
    ],
    "description": "主要城市间游客流向",
    "main_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/kA6RDxEjmR9AuNPP6OBFlQ8bo0j4332mEDbvOZ7j.png",
    "sub_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
    "point_image_path": "http://www.wuyue-tourism-dashboard.com/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
    "extra_config": "{}",
    "created_at": "2025-09-27T05:56:25.000000Z",
    "updated_at": "2025-10-07T05:56:28.000000Z"
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none||none|
|»» points|[object]|true|none||none|
|»»» name|string|true|none||none|
|»»» coordinate|[number]|true|none||none|
|»» lines|[object]|true|none||none|
|»»» source|string|false|none||none|
|»»» target|string|false|none||none|
|»» description|string|true|none||none|
|»» main_image|string|true|none||none|
|»» sub_image|string|true|none||none|
|»» point_image_path|string|true|none||none|
|»» extra_config|string|true|none||none|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 更新飞线图

POST /api/flyline-charts/{flyline_id}

更新飞线图

> Body 请求参数

```yaml
name: 全国旅游流向7
description: 主要城市间游客流向
points: '[{"name": "北京", "coordinate": [0.5, 0.4]},{"name": "上海", "coordinate":
  [0.7, 0.5]}]'
lines: '[    {"source": "北京", "target": "上海"}  ]'
main_image: file://G:\background\城市抽象.png
sub_image: '["file://G:\background\动漫人物 (3).png"]'
point_image_path: file://F:\webComplete
  Project\wuyue-tourism-dashboard\frontend-dashboard\src\assets\sign.png
extra_config: ""

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|flyline_id|path|integer| 是 |none|
|_method|query|string| 否 |patch请求（不可缺少，值必须是PATCH）|
|Authorization|header|string| 否 |none|
|Accept|header|string| 否 |none|
|Content-Type|header|string| 是 |none|
|body|body|object| 否 |none|
|» name|body|string| 否 |名字|
|» description|body|string| 是 |描述|
|» points|body|string| 是 |json字符串|
|» lines|body|string| 是 |json字符串|
|» main_image|body|string(binary)| 是 |主图|
|» sub_image|body|string(binary)| 是 |附图（可以省略）|
|» point_image_path|body|string(binary)| 否 |none|
|» extra_config|body|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "name": "全国旅游流向111",
    "description": "主要城市间游客流向111111",
    "points": [
      {
        "name": "北京",
        "coordinate": [
          0.5,
          0.4
        ]
      },
      {
        "name": "上海",
        "coordinate": [
          0.7,
          0.5
        ]
      }
    ],
    "lines": [
      {
        "source": "北京",
        "target": "上海"
      }
    ],
    "main_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/zmpalI6MGHDVStM1d9xEStsy6IOOCSuJKDsPo5CH.png",
    "sub_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/wt0PFexLmbwrJiATw9e9SCz796Ev8bUp1Aa9I3kG.jpg",
    "point_image_path": "http://www.wuyue-tourism-dashboard.com/storage/flylines/nGVmLUtXoaODThiBbiwSyYcGoN7NaXQcgZDDWG1S.png",
    "extra_config": null
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "飞线图不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none|名字|none|
|»» description|string|true|none|描述|none|
|»» points|[object]|true|none|点位图|none|
|»»» name|string|true|none||none|
|»»» coordinate|[number]|true|none||none|
|»» lines|[object]|true|none|线性图|none|
|»»» source|string|false|none||none|
|»»» target|string|false|none||none|
|»» main_image|string|true|none|主图|none|
|»» sub_image|string|true|none|附图（可以省略）|none|
|»» point_image_path|string|true|none||none|
|»» extra_config|null|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除飞线图

DELETE /api/flyline-charts/{flyline_id}

删除飞线图

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|flyline_id|path|integer| 是 |none|
|Authorization|header|string| 否 |none|
|Accept|header|string| 否 |none|
|body|body|object| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "飞线图不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增飞线图

POST /api/flyline-charts

新增飞线图

> Body 请求参数

```yaml
name: 全国旅游流向
description: 主要城市间游客流向
points: '{"name": "北京", "coordinate": [0.5, 0.4]},{"name": "上海", "coordinate":
  [0.7, 0.5]}'
lines: '{"source": "北京", "target": "上海"}'
main_image: file://G:\background\城市抽象.png
sub_image: file://G:\background\动漫壁纸2.jpg
point_image_path: file://F:\webComplete
  Project\wuyue-tourism-dashboard\frontend-dashboard\src\assets\sign.png
extra_config: ""

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|
|body|body|object| 否 |none|
|» name|body|string| 否 |名字|
|» description|body|string| 否 |描述|
|» points|body|string| 否 |点位图，json字符串|
|» lines|body|string| 否 |线性图，json字符串|
|» main_image|body|string(binary)| 否 |主图|
|» sub_image|body|string(binary)| 否 |附图（可以省略）|
|» point_image_path|body|string(binary)| 否 |none|
|» extra_config|body|string| 否 |none|

> 返回示例

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "name": "全国旅游流向11",
    "description": "主要城市间游客流向",
    "points": [
      {
        "name": "北京",
        "coordinate": [
          0.5,
          0.4
        ]
      },
      {
        "name": "上海",
        "coordinate": [
          0.7,
          0.5
        ]
      }
    ],
    "lines": [
      {
        "source": "北京",
        "target": "上海"
      }
    ],
    "main_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/2an0JGxCK5jil31VWXW0rMU91S08cYVWNVPfS1xC.png",
    "sub_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/CdwZl8ZTIVYt9Tqp8Xj8mJpVZNQwNpouqWCstbh3.png",
    "updated_at": "2025-09-24T12:46:08.000000Z",
    "created_at": "2025-09-24T12:46:08.000000Z",
    "id": 1
  }
}
```

```json
{
  "message": "飞线图名称已经存在",
  "errors": {
    "name": [
      "飞线图名称已经存在"
    ]
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 422 Response

```json
{
  "code": 0,
  "msg": "string"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|422|[Unprocessable Entity](https://tools.ietf.org/html/rfc2518#section-10.3)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none|飞线图名字|none|
|»» description|string|true|none|描述|none|
|»» points|[object]|true|none|点位图|none|
|»»» name|string|true|none||none|
|»»» coordinate|[string]|true|none||none|
|»»» halo|object|false|none||none|
|»»»» show|boolean|true|none||none|
|»»»» color|string|true|none||none|
|»»» icon|object|false|none||none|
|»»»» show|boolean|true|none||none|
|»»»» src|string|true|none||none|
|»»»» width|integer|true|none||none|
|»»»» height|integer|true|none||none|
|»» lines|[object]|true|none|线性图|none|
|»»» source|string|true|none||none|
|»»» target|string|true|none||none|
|»»» color|string|true|none||none|
|»» main_image|string|true|none|主图|none|
|»» sub_image|string|true|none|附图|none|
|»» point_image_path|string|true|none||none|
|»» extra_config|null|true|none||none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **422**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 飞线图中心点

## GET 获取飞线图中心点列表

GET /api/flyline-center-points/list

获取飞线图中心点列表

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "郑州",
      "image_path": "/storage/icons/center-zhengzhou.png",
      "width": 30,
      "height": 30,
      "halo_config": {
        "show": true,
        "color": "#00ffff"
      },
      "text_config": {
        "show": false
      },
      "extra_config": [],
      "created_at": "2025-09-27T06:05:30.000000Z",
      "updated_at": "2025-09-27T06:05:30.000000Z"
    },
    {
      "id": 2,
      "name": "南阳",
      "image_path": "/storage/icons/center-nanyang.png",
      "width": 28,
      "height": 28,
      "halo_config": {
        "show": true,
        "color": "#37a2da"
      },
      "text_config": {
        "show": true,
        "color": "#fff"
      },
      "extra_config": {
        "opacity": 0.9
      },
      "created_at": "2025-09-27T06:05:30.000000Z",
      "updated_at": "2025-09-27T06:05:30.000000Z"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名称|none|
|»» image_path|string|true|none||none|
|»» width|integer|true|none||none|
|»» height|integer|true|none||none|
|»» halo_config|object¦null|true|none||none|
|»»» show|boolean|true|none||none|
|»»» color|string|true|none||none|
|»» text_config|object¦null|true|none||none|
|»»» show|boolean|true|none||none|
|»»» color|string|true|none||none|
|»» extra_config|object¦null|true|none||none|
|»»» opacity|number|true|none||none|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|
|»» full_image_path|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取单个飞线图中心点详情

GET /api/flyline-center-points/{center_points_id}

获取单个飞线图中心点详情

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|center_points_id|path|string| 是 |none|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 1,
    "name": "郑州",
    "image_path": "/storage/icons/center-zhengzhou.png",
    "width": 30,
    "height": 30,
    "halo_config": {
      "show": true,
      "color": "#00ffff"
    },
    "text_config": {
      "show": false
    },
    "extra_config": [],
    "created_at": "2025-09-27T06:05:30.000000Z",
    "updated_at": "2025-09-27T06:05:30.000000Z"
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none||none|
|»» image_path|string|true|none||none|
|»» width|integer|true|none||none|
|»» height|integer|true|none||none|
|»» halo_config|object|true|none||none|
|»»» show|boolean|true|none||none|
|»»» color|string|true|none||none|
|»» text_config|object|true|none||none|
|»»» show|boolean|true|none||none|
|»» extra_config|[string]|true|none||none|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增飞线图中心点

POST /api/flyline-center-points/add

新增飞线图中心点

> Body 请求参数

```yaml
name: ""
image_path: ""
width: 0
height: 0
halo_config: ""
text_config: ""
extra_config: ""

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|
|body|body|object| 否 |none|
|» name|body|string| 否 |none|
|» image_path|body|string(binary)| 否 |none|
|» width|body|integer| 否 |none|
|» height|body|integer| 否 |none|
|» halo_config|body|string| 否 |none|
|» text_config|body|string| 否 |none|
|» extra_config|body|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "name": "北京",
    "image_path": "http://www.wuyue-tourism-dashboard.com/storage/flyline_center_points/sJq6UUvqkIj1TDYyeJgFFPTz8UOn0AHnnxwSRqvv.png",
    "width": "30",
    "height": "30",
    "halo_config": null,
    "text_config": null,
    "extra_config": null,
    "updated_at": "2025-09-27T06:43:58.000000Z",
    "created_at": "2025-09-27T06:43:58.000000Z",
    "id": 6
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none||none|
|»» image_path|string|true|none||none|
|»» width|string|true|none||none|
|»» height|string|true|none||none|
|»» halo_config|null|true|none||none|
|»» text_config|null|true|none||none|
|»» extra_config|null|true|none||none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 更新飞线图中心点

POST /api/flyline-center-points/{center_points_id}/update

更新飞线图中心点

> Body 请求参数

```yaml
name: ""
image_path: ""
width: 0
height: 0
halo_config: ""
text_config: ""
extra_config: ""

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|center_points_id|path|string| 是 |none|
|_method|query|string| 是 |none|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|
|body|body|object| 否 |none|
|» name|body|string| 否 |none|
|» image_path|body|string(binary)| 否 |none|
|» width|body|integer| 否 |none|
|» height|body|integer| 否 |none|
|» halo_config|body|string| 否 |none|
|» text_config|body|string| 否 |none|
|» extra_config|body|string| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 6,
    "name": "湖南",
    "image_path": "http://www.wuyue-tourism-dashboard.com/storage/flyline_center_points/1oOIKKQyqgQcKxnssUrDITeEDgJel2kuMQEQj68O.png",
    "width": "30",
    "height": "30",
    "halo_config": null,
    "text_config": null,
    "extra_config": null,
    "created_at": "2025-09-27T06:43:58.000000Z",
    "updated_at": "2025-09-27T06:48:02.000000Z"
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none||none|
|»» image_path|string|true|none||none|
|»» width|string|true|none||none|
|»» height|string|true|none||none|
|»» halo_config|null|true|none||none|
|»» text_config|null|true|none||none|
|»» extra_config|null|true|none||none|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除飞线图中心点

DELETE /api/flyline-center-points/{center_points_id}/delete

删除飞线图中心点

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|center_points_id|path|string| 是 |none|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» message|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 山脉

## GET 按名称查询山脉

GET /api/mountains/search/name

按名称查询山脉

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|mountain_name|query|string| 否 |none|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "华山",
      "province": "陕西"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|山的名字|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取山脉名称列表

GET /api/mountains/name

获取所有山脉的名称

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "华山"
    },
    {
      "id": 5,
      "name": "嵩山"
    },
    {
      "id": 4,
      "name": "恒山"
    },
    {
      "id": 2,
      "name": "泰山"
    },
    {
      "id": 3,
      "name": "衡山"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|山的名字|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取山脉列表分页

GET /api/mountains/

获取山脉信息列表分页

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|page|query|string| 否 |当前页数|
|per_page|query|string| 否 |每页显示的数据条数|
|Authorization|header|string| 否 |none|
|Accept|header|string| 是 |none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "name": "华山",
        "province": "陕西",
        "created_at": "2025-09-22T02:07:25.000000Z",
        "updated_at": "2025-09-22T02:07:25.000000Z"
      },
      {
        "id": 2,
        "name": "泰山",
        "province": "山东",
        "created_at": "2025-09-22T02:07:25.000000Z",
        "updated_at": "2025-09-22T02:07:25.000000Z"
      },
      {
        "id": 3,
        "name": "衡山",
        "province": "湖南",
        "created_at": "2025-09-22T02:07:25.000000Z",
        "updated_at": "2025-09-22T02:07:25.000000Z"
      },
      {
        "id": 4,
        "name": "恒山",
        "province": "山西",
        "created_at": "2025-09-22T02:07:25.000000Z",
        "updated_at": "2025-09-22T02:07:25.000000Z"
      },
      {
        "id": 5,
        "name": "嵩山",
        "province": "河南",
        "created_at": "2025-09-22T02:07:25.000000Z",
        "updated_at": "2025-09-22T02:07:25.000000Z"
      }
    ],
    "first_page_url": "http://www.wuyue-tourism-dashboard.com/api/mountains?page=1",
    "from": 1,
    "last_page": 1,
    "last_page_url": "http://www.wuyue-tourism-dashboard.com/api/mountains?page=1",
    "links": [
      {
        "url": null,
        "label": "&laquo; 上一页",
        "page": null,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/mountains?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": null,
        "label": "下一页 &raquo;",
        "page": null,
        "active": false
      }
    ],
    "next_page_url": null,
    "path": "http://www.wuyue-tourism-dashboard.com/api/mountains",
    "per_page": 10,
    "prev_page_url": null,
    "to": 5,
    "total": 5
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» current_page|integer|true|none|当前页码|none|
|»» data|[object]|true|none|当前页的数据列表|none|
|»»» id|integer|true|none||none|
|»»» name|string|true|none||none|
|»»» province|string|true|none||none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»» first_page_url|string|true|none|第一页的 URL|none|
|»» from|integer|true|none|当前页数据的起始位置（基于 1 的索引）|none|
|»» last_page|integer|true|none|数据分页的最后一页的页码|none|
|»» last_page_url|string|true|none|最后一页的 URL|none|
|»» links|[object]|true|none|链接数组|包含了分页链接的信息，每个链接是一个对象，包含了 url、label、page 和 active 等字段|
|»»» url|string¦null|true|none|指向该页的 URL|none|
|»»» label|string|true|none|页码的显示文本（例如 "1" 或 "« 上一页"）|none|
|»»» page|integer¦null|true|none|页码|none|
|»»» active|boolean|true|none|指示该链接是否为当前页，如果是当前页则为 true，否则为 false|none|
|»» next_page_url|null|true|none|下一页的 URL，如果没有更多页则为 null|none|
|»» path|string|true|none|生成分页 URL 的基础路径|none|
|»» per_page|integer|true|none|每页显示的数据条数|none|
|»» prev_page_url|null|true|none|前一页的 URL，如果没有前一页则为 null|none|
|»» to|integer|true|none|当前页数据的结束位置（基于 1 的索引）|none|
|»» total|integer|true|none|数据总条数|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增山脉

POST /api/mountains/add

新增山脉

> Body 请求参数

```json
{
  "name": "string",
  "province": "string"
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 是 | 名字|none|
|» province|body|string| 是 | 所属省份|none|

> 返回示例

> 200 Response

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "name": "string",
    "province": "string",
    "updated_at": "string",
    "created_at": "string",
    "id": 0
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none|名字|none|
|»» province|string|true|none|所属省份|none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## PATCH 更新山脉

PATCH /api/mountains/{mountain_id}/update

更新山脉

> Body 请求参数

```json
{
  "name": "string",
  "province": "string"
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|mountain_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 是 | 名字|none|
|» province|body|string| 是 | 所属省份|none|

> 返回示例

> 200 Response

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "name": "string",
    "province": "string",
    "updated_at": "string",
    "created_at": "string",
    "id": 0
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none|名字|none|
|»» province|string|true|none|所属省份|none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除山脉

DELETE /api/mountains/{mountain_id}/delete

删除山脉

> Body 请求参数

```json
{
  "name": "string",
  "province": "string"
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|mountain_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 是 | 名字|none|
|» province|body|string| 是 | 所属省份|none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 月度数据：山脉游客数量与收入列表

## GET 获取：所有山脉的月度统计数据

GET /api/monthly-stats/all

获取：所有山脉的月度统计数据

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|page|query|string| 否 ||none|
|per_page|query|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "year": 2015,
        "month": 1,
        "tourist_count": 486526,
        "income": "39697664.40",
        "created_at": "2025-09-24T12:22:26.000000Z",
        "updated_at": "2025-09-24T12:22:26.000000Z",
        "mountain": {
          "id": 1,
          "name": "华山",
          "province": "陕西"
        }
      },
      {
        "id": 2,
        "year": 2015,
        "month": 2,
        "tourist_count": 105737,
        "income": "40611836.11",
        "created_at": "2025-09-24T12:22:26.000000Z",
        "updated_at": "2025-09-24T12:22:26.000000Z",
        "mountain": {
          "id": 1,
          "name": "华山",
          "province": "陕西"
        }
      },
      {
        "id": 3,
        "year": 2015,
        "month": 3,
        "tourist_count": 181768,
        "income": "28339843.67",
        "created_at": "2025-09-24T12:22:26.000000Z",
        "updated_at": "2025-09-24T12:22:26.000000Z",
        "mountain": {
          "id": 1,
          "name": "华山",
          "province": "陕西"
        }
      },
      {
        "id": 4,
        "year": 2015,
        "month": 4,
        "tourist_count": 230942,
        "income": "47042091.99",
        "created_at": "2025-09-24T12:22:26.000000Z",
        "updated_at": "2025-09-24T12:22:26.000000Z",
        "mountain": {
          "id": 1,
          "name": "华山",
          "province": "陕西"
        }
      },
      {
        "id": 5,
        "year": 2015,
        "month": 5,
        "tourist_count": 447570,
        "income": "3788740.23",
        "created_at": "2025-09-24T12:22:26.000000Z",
        "updated_at": "2025-09-24T12:22:26.000000Z",
        "mountain": {
          "id": 1,
          "name": "华山",
          "province": "陕西"
        }
      }
    ],
    "first_page_url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=1",
    "from": 1,
    "last_page": 132,
    "last_page_url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=132",
    "links": [
      {
        "url": null,
        "label": "&laquo; 上一页",
        "page": null,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=2",
        "label": "2",
        "page": 2,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=3",
        "label": "3",
        "page": 3,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=4",
        "label": "4",
        "page": 4,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=5",
        "label": "5",
        "page": 5,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=6",
        "label": "6",
        "page": 6,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=7",
        "label": "7",
        "page": 7,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=8",
        "label": "8",
        "page": 8,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=9",
        "label": "9",
        "page": 9,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=10",
        "label": "10",
        "page": 10,
        "active": false
      },
      {
        "url": null,
        "label": "...",
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=131",
        "label": "131",
        "page": 131,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=132",
        "label": "132",
        "page": 132,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=2",
        "label": "下一页 &raquo;",
        "page": 2,
        "active": false
      }
    ],
    "next_page_url": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all?page=2",
    "path": "http://www.wuyue-tourism-dashboard.com/api/monthly-stats/all",
    "per_page": 5,
    "prev_page_url": null,
    "to": 5,
    "total": 660
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "山脉不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» current_page|integer|true|none|当前页码|none|
|»» data|[object]|true|none|当前页的数据列表|none|
|»»» id|integer|true|none||none|
|»»» year|integer|true|none||none|
|»»» month|integer|true|none||none|
|»»» tourist_count|integer|true|none||none|
|»»» income|string|true|none||none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»»» mountain|object|true|none||none|
|»»»» id|integer|true|none||none|
|»»»» name|string|true|none||none|
|»»»» province|string|true|none||none|
|»» first_page_url|string|true|none|第一页的 URL|none|
|»» from|integer|true|none|当前页数据的起始位置（基于 1 的索引）|none|
|»» last_page|integer|true|none|数据分页的最后一页的页码|none|
|»» last_page_url|string|true|none|最后一页的 URL|none|
|»» links|[object]|true|none|链接数组|包含了分页链接的信息，每个链接是一个对象，包含了 url、label、page 和 active 等字段|
|»»» url|string¦null|true|none|指向该页的 URL|none|
|»»» label|string|true|none|页码的显示文本（例如 "1" 或 "« 上一页"）|none|
|»»» page|integer¦null|true|none|页码|none|
|»»» active|boolean|true|none|指示该链接是否为当前页，如果是当前页则为 true，否则为 false|none|
|»» next_page_url|string|true|none|下一页的 URL，如果没有更多页则为 null|none|
|»» path|string|true|none|生成分页 URL 的基础路径|none|
|»» per_page|integer|true|none|每页显示的数据条数|none|
|»» prev_page_url|null|true|none|前一页的 URL，如果没有前一页则为 null|none|
|»» to|integer|true|none|当前页数据的结束位置（基于 1 的索引）|none|
|»» total|integer|true|none|数据总条数|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取：指定山脉月度统计列表

GET /api/monthly-stats/{mountain_id}

获取：指定山脉游客数量与收入列表

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|mountain_id|path|string| 是 ||none|
|year|query|integer| 否 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 61,
      "year": 2020,
      "month": 1,
      "tourist_count": 471577,
      "income": "27830238.69",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 62,
      "year": 2020,
      "month": 2,
      "tourist_count": 272519,
      "income": "3234873.02",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 63,
      "year": 2020,
      "month": 3,
      "tourist_count": 93931,
      "income": "21757879.29",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 64,
      "year": 2020,
      "month": 4,
      "tourist_count": 408146,
      "income": "25256053.84",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 65,
      "year": 2020,
      "month": 5,
      "tourist_count": 157391,
      "income": "506156.47",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 66,
      "year": 2020,
      "month": 6,
      "tourist_count": 421428,
      "income": "48831703.19",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 67,
      "year": 2020,
      "month": 7,
      "tourist_count": 379324,
      "income": "8081470.16",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 68,
      "year": 2020,
      "month": 8,
      "tourist_count": 446379,
      "income": "23543673.66",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 69,
      "year": 2020,
      "month": 9,
      "tourist_count": 155191,
      "income": "47082584.15",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 70,
      "year": 2020,
      "month": 10,
      "tourist_count": 296845,
      "income": "45157180.11",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 71,
      "year": 2020,
      "month": 11,
      "tourist_count": 123722,
      "income": "24403062.18",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    },
    {
      "id": 72,
      "year": 2020,
      "month": 12,
      "tourist_count": 395755,
      "income": "7938328.99",
      "created_at": "2025-09-22T06:02:16.000000Z",
      "updated_at": "2025-09-22T06:02:16.000000Z"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "山脉不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|true|none||none|
|»» year|integer|true|none|年份|none|
|»» month|integer|true|none|月份|none|
|»» tourist_count|integer|true|none|游客数量|none|
|»» income|string|true|none|收入|none|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增：指定山脉月度统计数据

POST /api/monthly-stats/{mountain_id}/add

新增：指定山脉 `游客数量（tourist_count）` 与 `收入（income）` 列表
`tourist_count`和`income`可以都存在，但至少存在一个

> Body 请求参数

```json
{
  "year": 0,
  "month": 0,
  "tourist_count": 0,
  "income": 0
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|mountain_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» year|body|integer| 是 | 年份|none|
|» month|body|integer| 是 | 月份|none|
|» tourist_count|body|integer| 是 | 游客数量|可选，如果已经存在income|
|» income|body|number| 是 | 收入|可选，如果已经存在tourist_count|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "year": 2026,
    "month": 3,
    "tourist_count": 379974,
    "income": 17540102.91,
    "updated_at": "2025-09-22T12:46:03.000000Z",
    "created_at": "2025-09-22T12:46:03.000000Z",
    "id": 664
  }
}
```

> 400 Response

```json
{
  "code": 0,
  "msg": "string"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» year|integer|true|none|年份|none|
|»» month|integer|true|none|月份|none|
|»» tourist_count|integer|true|none|游客数量|none|
|»» income|number|true|none|收入|none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **400**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## PATCH 更新：月度统计数据

PATCH /api/monthly-stats/{monthly_id}/update

更新：指定山脉 `游客数量（tourist_count）` 与 `收入（income）` 列表
`tourist_count`和`income`可以都存在，但至少存在一个

> Body 请求参数

```json
{
  "year": 0,
  "month": 0,
  "tourist_count": 0,
  "income": 0
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|monthly_id|path|string| 是 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|
|body|body|object| 否 ||none|
|» year|body|integer| 是 | 年份|none|
|» month|body|integer| 是 | 月份|none|
|» tourist_count|body|integer| 是 | 游客数量|可选，如果已经存在income|
|» income|body|number| 是 | 收入|可选，如果已经存在tourist_count|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 7,
    "year": 2015,
    "month": 7,
    "tourist_count": 438346,
    "income": "54262433.62",
    "created_at": "2025-09-22T12:56:40.000000Z",
    "updated_at": "2025-09-23T03:58:45.000000Z"
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» year|integer|true|none|年份|none|
|»» month|integer|true|none|月份|none|
|»» tourist_count|integer|true|none|游客数量|none|
|»» income|string|true|none|收入|none|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除：月度统计数据

DELETE /api/monthly-stats/{monthly_id}/delete

新增：山脉游客数量或收入列表

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|monthly_id|path|string| 是 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 年度数据：山脉高度与植被覆盖率列表

## GET 获取：所有山脉的年度统计数据

GET /api/annual-stats/all

获取：所有山脉的年度统计数据

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|page|query|string| 否 ||none|
|per_page|query|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "year": 2015,
        "height": "2625.00",
        "vegetation_coverage": "80.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T13:15:23.000000Z",
        "mountain": {
          "id": 3,
          "name": "衡山",
          "province": "湖南"
        }
      },
      {
        "id": 2,
        "year": 2016,
        "height": "2385.00",
        "vegetation_coverage": "80.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z",
        "mountain": {
          "id": 2,
          "name": "泰山",
          "province": "山东"
        }
      },
      {
        "id": 3,
        "year": 2017,
        "height": "1486.00",
        "vegetation_coverage": "80.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z",
        "mountain": {
          "id": 5,
          "name": "嵩山",
          "province": "河南"
        }
      },
      {
        "id": 4,
        "year": 2018,
        "height": "1803.00",
        "vegetation_coverage": "52.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z",
        "mountain": {
          "id": 4,
          "name": "恒山",
          "province": "山西"
        }
      },
      {
        "id": 5,
        "year": 2019,
        "height": "1071.00",
        "vegetation_coverage": "71.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z",
        "mountain": {
          "id": 5,
          "name": "嵩山",
          "province": "河南"
        }
      }
    ],
    "first_page_url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=1",
    "from": 1,
    "last_page": 3,
    "last_page_url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=3",
    "links": [
      {
        "url": null,
        "label": "&laquo; 上一页",
        "page": null,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=2",
        "label": "2",
        "page": 2,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=3",
        "label": "3",
        "page": 3,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=2",
        "label": "下一页 &raquo;",
        "page": 2,
        "active": false
      }
    ],
    "next_page_url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all?page=2",
    "path": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/all",
    "per_page": 5,
    "prev_page_url": null,
    "to": 5,
    "total": 12
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "山脉不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» current_page|integer|true|none|当前页码|none|
|»» data|[object]|true|none|当前页的数据列表|none|
|»»» id|integer|true|none||none|
|»»» year|integer|true|none||none|
|»»» height|string|true|none||none|
|»»» vegetation_coverage|string|true|none||none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»»» mountain|object|true|none||none|
|»»»» id|integer|true|none||none|
|»»»» name|string|true|none||none|
|»»»» province|string|true|none||none|
|»» first_page_url|string|true|none|第一页的 URL|none|
|»» from|integer|true|none|当前页数据的起始位置（基于 1 的索引）|none|
|»» last_page|integer|true|none|数据分页的最后一页的页码|none|
|»» last_page_url|string|true|none|最后一页的 URL|none|
|»» links|[object]|true|none|链接数组|包含了分页链接的信息，每个链接是一个对象，包含了 url、label、page 和 active 等字段|
|»»» url|string¦null|true|none|指向该页的 URL|none|
|»»» label|string|true|none|页码的显示文本（例如 "1" 或 "« 上一页"）|none|
|»»» page|integer¦null|true|none|页码|none|
|»»» active|boolean|true|none|指示该链接是否为当前页，如果是当前页则为 true，否则为 false|none|
|»» next_page_url|string|true|none|下一页的 URL，如果没有更多页则为 null|none|
|»» path|string|true|none|生成分页 URL 的基础路径|none|
|»» per_page|integer|true|none|每页显示的数据条数|none|
|»» prev_page_url|null|true|none|前一页的 URL，如果没有前一页则为 null|none|
|»» to|integer|true|none|当前页数据的结束位置（基于 1 的索引）|none|
|»» total|integer|true|none|数据总条数|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取：指定山脉年度统计列表

GET /api/annual-stats/{mountain_id}

获取指定山脉盖度与植被覆盖率列表

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|mountain_id|path|string| 是 ||none|
|page|query|string| 是 ||分页页码|
|per_page|query|string| 是 ||每页显示的数据条数|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 6,
        "year": 2020,
        "height": "2174.00",
        "vegetation_coverage": "66.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z"
      },
      {
        "id": 9,
        "year": 2023,
        "height": "1391.00",
        "vegetation_coverage": "80.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z"
      },
      {
        "id": 11,
        "year": 2025,
        "height": "1488.00",
        "vegetation_coverage": "85.00",
        "created_at": "2025-09-24T12:22:40.000000Z",
        "updated_at": "2025-09-24T12:22:40.000000Z"
      }
    ],
    "first_page_url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/1?page=1",
    "from": 1,
    "last_page": 1,
    "last_page_url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/1?page=1",
    "links": [
      {
        "url": null,
        "label": "&laquo; 上一页",
        "page": null,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/1?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": null,
        "label": "下一页 &raquo;",
        "page": null,
        "active": false
      }
    ],
    "next_page_url": null,
    "path": "http://www.wuyue-tourism-dashboard.com/api/annual-stats/1",
    "per_page": 5,
    "prev_page_url": null,
    "to": 3,
    "total": 3
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "山脉不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» current_page|integer|true|none|当前页码|none|
|»» data|[object]|true|none|当前页的数据列表|none|
|»»» id|integer|true|none||none|
|»»» year|integer|true|none||none|
|»»» height|string|true|none||none|
|»»» vegetation_coverage|string|true|none||none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»» first_page_url|string|true|none|第一页的 URL|none|
|»» from|integer|true|none|当前页数据的起始位置（基于 1 的索引）|none|
|»» last_page|integer|true|none|数据分页的最后一页的页码|none|
|»» last_page_url|string|true|none|最后一页的 URL|none|
|»» links|[object]|true|none|链接数组|包含了分页链接的信息，每个链接是一个对象，包含了 url、label、page 和 active 等字段|
|»»» url|string¦null|true|none|指向该页的 URL|none|
|»»» label|string|true|none|页码的显示文本（例如 "1" 或 "« 上一页"）|none|
|»»» page|integer¦null|true|none|页码|none|
|»»» active|boolean|true|none|指示该链接是否为当前页，如果是当前页则为 true，否则为 false|none|
|»» next_page_url|null|true|none|下一页的 URL，如果没有更多页则为 null|none|
|»» path|string|true|none|生成分页 URL 的基础路径|none|
|»» per_page|integer|true|none|每页显示的数据条数|none|
|»» prev_page_url|null|true|none|前一页的 URL，如果没有前一页则为 null|none|
|»» to|integer|true|none|当前页数据的结束位置（基于 1 的索引）|none|
|»» total|integer|true|none|数据总条数|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增：指定山脉年度统计数据

POST /api/annual-stats/{mountain_id}/add

新增：指定山脉 `高度（height）` 与 `植被覆盖率（vegetation_coverage）` 
`tourist_count`和`income`可以都存在，但至少存在一个

> Body 请求参数

```json
{
  "year": 0,
  "height": 0,
  "vegetation_coverage": 0
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|mountain_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» year|body|integer| 是 | 年份|none|
|» height|body|number| 是 | 高度|可选，如果已经存在vegetation_coverage|
|» vegetation_coverage|body|number| 是 | 植被覆盖率|可选，如果已经存在height|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "year": 2028,
    "height": 245532,
    "vegetation_coverage": 20,
    "updated_at": "2025-09-22T12:43:49.000000Z",
    "created_at": "2025-09-22T12:43:49.000000Z",
    "id": 14
  }
}
```

> 400 Response

```json
{
  "code": 400,
  "msg": "该年份的统计数据已存在"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» year|integer|true|none||none|
|»» month|integer|true|none||none|
|»» tourist_count|integer|true|none||none|
|»» income|number|true|none||none|
|»» mountain_id|integer|true|none||none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **400**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## PATCH 更新：年度统计数据

PATCH /api/annual-stats/{annual_id}/update

更新：指定山脉 `高度（height）` 与 `植被覆盖率（vegetation_coverage）` 
`tourist_count`和`income`可以都存在，但至少存在一个

> Body 请求参数

```json
{
  "year": 0,
  "height": 0,
  "vegetation_coverage": 0
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|annual_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» year|body|integer| 是 | 年份|none|
|» height|body|number| 是 | 高度|none|
|» vegetation_coverage|body|number| 是 | 植被覆盖率|none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 1,
    "year": 2015,
    "height": "83.00",
    "vegetation_coverage": "83.00",
    "created_at": "2025-09-24T12:22:40.000000Z",
    "updated_at": "2025-09-24T13:10:57.000000Z",
    "mountain_name": "嵩山"
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "没有找到对应的山脉"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» tourist_count|integer|true|none|年份|none|
|»» height|number|true|none|高度|none|
|»» vegetation_coverage|number|true|none|植被覆盖率|none|
|»» mountain_name|string|true|none|山脉名字|none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除：年度统计数据

DELETE /api/annual-stats/{annual_id}/delete

删除年度统计数据

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|annual_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 可视化页面配置项

## GET 按名称查询可视化配置

GET /api/visualization-configs/search/name

按名称查询可视化配置

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|visualization_name|query|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "五岳智游数据可视化",
      "year": 2025,
      "background_image": "/storage/visualizations/pddfkcdVwiciyFntbNIMSxg4O2vCBiPad3JvREMY.jpg",
      "config_json": {
        "title": "五岳智游数据可视化",
        "borderColor": "['#4fd2dd', '#235fa7']",
        "echartsAnimationTime": 1500
      },
      "is_active": 0,
      "created_at": "2025-09-24T01:46:52.000000Z",
      "updated_at": "2025-09-24T08:29:51.000000Z",
      "mountain_names": [
        {
          "id": 1,
          "name": "华山",
          "province": "陕西"
        },
        {
          "id": 2,
          "name": "泰山",
          "province": "山东"
        },
        {
          "id": 3,
          "name": "衡山",
          "province": "湖南"
        }
      ],
      "flyline_chart_name": "全国旅游流向5"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|false|none||none|
|»» name|string|false|none|配置名|none|
|»» year|integer|false|none|年份|none|
|»» background_image|string|false|none|背景图|none|
|»» config_json|object|false|none|额外配置|none|
|»»» title|string|true|none||none|
|»»» borderColor|string|true|none||none|
|»»» echartsAnimationTime|integer|true|none||none|
|»» is_active|integer|false|none|是否启用|必需<br />默认0，1为启用，0为不启用|
|»» created_at|string|false|none||none|
|»» updated_at|string|false|none||none|
|»» mountain_info|[object]|false|none|山脉名字|none|
|»»» id|integer|true|none||none|
|»»» name|string|true|none|山脉名字|none|
|»»» province|string|true|none|所属省份|none|
|»» flyline_chart_name|string|false|none|飞线图名字|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取开启状态可视化配置详情

GET /api/visualization-configs/active

### **前端展示用，调用此API**
获取单个可视化配置详情，包含可视化界面的全部数据（前端展示用）

### 请求头验证  :
X-API-KEY:  `super-secret-visualization-key`

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Accept|header|string| 是 ||none|
|X-API-KEY|header|string| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 2,
    "name": "五岳智游数据可化-6",
    "flyline_chart": {
      "id": 1,
      "name": "全国旅游流向5",
      "points": [
        {
          "name": "北京",
          "coordinate": [
            0.5,
            0.4
          ]
        },
        {
          "name": "上海",
          "coordinate": [
            0.7,
            0.5
          ]
        }
      ],
      "lines": [
        {
          "source": "北京",
          "target": "上海"
        }
      ],
      "description": "主要城市间游客流向",
      "main_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/kA6RDxEjmR9AuNPP6OBFlQ8bo0j4332mEDbvOZ7j.png",
      "sub_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
      "point_image_path": "/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
      "extra_config": "{}",
      "created_at": "2025-09-27T05:56:25.000000Z",
      "updated_at": "2025-10-07T05:56:28.000000Z"
    },
    "background_image": "http://www.wuyue-tourism-dashboard.com/storage/visualizations/XHOuEIx2mWBbXckg12KFCIraX83ITBqAQUosDXOb.jpg",
    "config_json": "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd', '#235fa7']\", \"echartsAnimationTime\": 1500}",
    "monthlyStats": [
      {
        "mountain_name": "华山",
        "mountain_monthly_stats": [
          {
            "id": 121,
            "year": 2025,
            "month": 1,
            "tourist_count": 7552,
            "income": "25064821.30",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 122,
            "year": 2025,
            "month": 2,
            "tourist_count": 210486,
            "income": "41561252.84",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 123,
            "year": 2025,
            "month": 3,
            "tourist_count": 496742,
            "income": "8447848.37",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 124,
            "year": 2025,
            "month": 4,
            "tourist_count": 60946,
            "income": "4979943.31",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 125,
            "year": 2025,
            "month": 5,
            "tourist_count": 216566,
            "income": "19553941.67",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 126,
            "year": 2025,
            "month": 6,
            "tourist_count": 447095,
            "income": "24487115.55",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 127,
            "year": 2025,
            "month": 7,
            "tourist_count": 65461,
            "income": "36952535.82",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 128,
            "year": 2025,
            "month": 8,
            "tourist_count": 99744,
            "income": "24770993.03",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 129,
            "year": 2025,
            "month": 9,
            "tourist_count": 253334,
            "income": "46649291.14",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 130,
            "year": 2025,
            "month": 10,
            "tourist_count": 197582,
            "income": "8301523.56",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 131,
            "year": 2025,
            "month": 11,
            "tourist_count": 391463,
            "income": "20936965.50",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 132,
            "year": 2025,
            "month": 12,
            "tourist_count": 87693,
            "income": "16291231.53",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          }
        ]
      },
      {
        "mountain_name": "泰山",
        "mountain_monthly_stats": [
          {
            "id": 253,
            "year": 2025,
            "month": 1,
            "tourist_count": 303995,
            "income": "43659946.92",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 254,
            "year": 2025,
            "month": 2,
            "tourist_count": 348969,
            "income": "24411608.73",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 255,
            "year": 2025,
            "month": 3,
            "tourist_count": 423086,
            "income": "2413273.22",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 256,
            "year": 2025,
            "month": 4,
            "tourist_count": 61536,
            "income": "43061662.72",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 257,
            "year": 2025,
            "month": 5,
            "tourist_count": 12484,
            "income": "45815195.59",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 258,
            "year": 2025,
            "month": 6,
            "tourist_count": 342039,
            "income": "31973402.57",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 259,
            "year": 2025,
            "month": 7,
            "tourist_count": 313172,
            "income": "20490097.83",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 260,
            "year": 2025,
            "month": 8,
            "tourist_count": 343624,
            "income": "41018937.67",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 261,
            "year": 2025,
            "month": 9,
            "tourist_count": 35001,
            "income": "31950211.45",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 262,
            "year": 2025,
            "month": 10,
            "tourist_count": 167742,
            "income": "44308407.90",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 263,
            "year": 2025,
            "month": 11,
            "tourist_count": 395206,
            "income": "34906587.27",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 264,
            "year": 2025,
            "month": 12,
            "tourist_count": 394257,
            "income": "45207346.36",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          }
        ]
      },
      {
        "mountain_name": "衡山",
        "mountain_monthly_stats": [
          {
            "id": 385,
            "year": 2025,
            "month": 1,
            "tourist_count": 354840,
            "income": "3331644.53",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 386,
            "year": 2025,
            "month": 2,
            "tourist_count": 206323,
            "income": "24492827.66",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 387,
            "year": 2025,
            "month": 3,
            "tourist_count": 363869,
            "income": "25368162.07",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 388,
            "year": 2025,
            "month": 4,
            "tourist_count": 105275,
            "income": "7899285.93",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 389,
            "year": 2025,
            "month": 5,
            "tourist_count": 181295,
            "income": "40591945.83",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 390,
            "year": 2025,
            "month": 6,
            "tourist_count": 431498,
            "income": "32798912.09",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 391,
            "year": 2025,
            "month": 7,
            "tourist_count": 460352,
            "income": "1526936.88",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 392,
            "year": 2025,
            "month": 8,
            "tourist_count": 94858,
            "income": "5268322.89",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 393,
            "year": 2025,
            "month": 9,
            "tourist_count": 137468,
            "income": "30879266.34",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 394,
            "year": 2025,
            "month": 10,
            "tourist_count": 361874,
            "income": "47950765.13",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 395,
            "year": 2025,
            "month": 11,
            "tourist_count": 114151,
            "income": "7157804.93",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 396,
            "year": 2025,
            "month": 12,
            "tourist_count": 351922,
            "income": "35927269.92",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          }
        ]
      }
    ],
    "annualStats": [
      {
        "mountain_name": "华山",
        "mountain_annual_stats": null
      },
      {
        "mountain_name": "泰山",
        "mountain_annual_stats": {
          "id": 11,
          "year": 2025,
          "height": "1644.00",
          "vegetation_coverage": "70.00",
          "created_at": "2025-09-27T06:04:53.000000Z",
          "updated_at": "2025-09-27T06:04:53.000000Z"
        }
      },
      {
        "mountain_name": "衡山",
        "mountain_annual_stats": null
      }
    ]
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» flyline_chart|object|true|none|飞线图信息|none|
|»»» id|integer|true|none||none|
|»»» name|string|true|none|飞线图名字|none|
|»»» points|[object]|true|none|点位图|none|
|»»»» name|string|true|none||none|
|»»»» coordinate|[number]|true|none||none|
|»»» lines|[object]|true|none|线性图|none|
|»»»» source|string|false|none||none|
|»»»» target|string|false|none||none|
|»»» description|string|true|none|描述|none|
|»»» main_image|string|true|none|主图|none|
|»»» sub_image|string|true|none|附图|none|
|»»» point_image_path|string|true|none||none|
|»»» extra_config|string|true|none||none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»» background_image|string|true|none|背景图|none|
|»» config_json|string|true|none|额外配置|none|
|»» monthlyStats|[object]|true|none|月份统计|none|
|»»» mountain_name|string|true|none|山脉名字|none|
|»»» mountain_monthly_stats|[object]|true|none|月份统计|none|
|»»»» id|integer|true|none||none|
|»»»» year|integer|true|none|年份|none|
|»»»» month|integer|true|none|月份|none|
|»»»» tourist_count|integer|true|none|游客数量|none|
|»»»» income|string|true|none|收入|none|
|»»»» created_at|string|true|none||none|
|»»»» updated_at|string|true|none||none|
|»» annualStats|[object]|true|none|年份统计|none|
|»»» mountain_name|string|true|none|山脉名字|none|
|»»» mountain_annual_stats|object¦null|true|none|年份统计|none|
|»»»» id|integer|true|none||none|
|»»»» year|integer|true|none|年份|none|
|»»»» height|string|true|none|高度|none|
|»»»» vegetation_coverage|string|true|none|植被覆盖率|none|
|»»»» created_at|string|true|none||none|
|»»»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取可视化配置列表

GET /api/visualization-configs/list

获取可视化配置列表

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|page|query|string| 是 ||分页页码|
|per_page|query|string| 是 ||每页显示的数据条数|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "name": "五岳智游数据可视化",
        "year": 2025,
        "background_image": "http://www.wuyue-tourism-dashboard.com/storage/visualizations/pddfkcdVwiciyFntbNIMSxg4O2vCBiPad3JvREMY.jpg",
        "config_json": {
          "title": "五岳智游数据可视化",
          "borderColor": "['#4fd2dd', '#235fa7']",
          "echartsAnimationTime": 1500
        },
        "is_active": 0,
        "created_at": "2025-09-24T01:46:52.000000Z",
        "updated_at": "2025-09-24T08:29:51.000000Z",
        "flyline_chart_name": "全国旅游流向5",
        "mountain_info": [
          {
            "id": 1,
            "name": "华山",
            "province": "陕西"
          },
          {
            "id": 2,
            "name": "泰山",
            "province": "山东"
          },
          {
            "id": 3,
            "name": "衡山",
            "province": "湖南"
          }
        ]
      },
      {
        "id": 2,
        "name": "五岳智游数据可化-6",
        "year": 2025,
        "background_image": "http://www.wuyue-tourism-dashboard.com/storage/visualizations/XHOuEIx2mWBbXckg12KFCIraX83ITBqAQUosDXOb.jpg",
        "config_json": "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd', '#235fa7']\", \"echartsAnimationTime\": 1500}",
        "is_active": 0,
        "created_at": "2025-09-24T05:51:39.000000Z",
        "updated_at": "2025-09-24T13:53:11.000000Z",
        "flyline_chart_name": "全国旅游流向5",
        "mountain_info": [
          {
            "id": 1,
            "name": "华山",
            "province": "陕西"
          },
          {
            "id": 2,
            "name": "泰山",
            "province": "山东"
          },
          {
            "id": 3,
            "name": "衡山",
            "province": "湖南"
          }
        ]
      }
    ],
    "first_page_url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=1",
    "from": 1,
    "last_page": 3,
    "last_page_url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=3",
    "links": [
      {
        "url": null,
        "label": "&laquo; 上一页",
        "page": null,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=2",
        "label": "2",
        "page": 2,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=3",
        "label": "3",
        "page": 3,
        "active": false
      },
      {
        "url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=2",
        "label": "下一页 &raquo;",
        "page": 2,
        "active": false
      }
    ],
    "next_page_url": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list?page=2",
    "path": "http://www.wuyue-tourism-dashboard.com/api/visualization-configs/list",
    "per_page": 2,
    "prev_page_url": null,
    "to": 2,
    "total": 5
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» current_page|integer|true|none|当前页码|none|
|»» data|[object]|true|none|当前页的数据列表|none|
|»»» id|integer|true|none||none|
|»»» name|string|true|none|【配置项名字|none|
|»»» mountain_info|[object]|true|none|山信息|none|
|»»»» id|integer|true|none||none|
|»»»» name|string|true|none|山脉名字|none|
|»»»» province|string|true|none|省份名称|none|
|»»» year|integer|true|none|年份|none|
|»»» background_image|string|true|none|背景图片|none|
|»»» config_json|object|true|none|额外配置|none|
|»»»» title|string|true|none||none|
|»»»» borderColor|string|true|none||none|
|»»»» echartsAnimationTime|integer|true|none||none|
|»»» is_active|integer|true|none|是否激活|none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»»» flyline_chart_name|string|true|none||none|
|»» first_page_url|string|true|none|第一页的 URL|none|
|»» from|integer|true|none|当前页数据的起始位置（基于 1 的索引）|none|
|»» last_page|integer|true|none|数据分页的最后一页的页码|none|
|»» last_page_url|string|true|none|最后一页的 URL|none|
|»» links|[object]|true|none|链接数组|包含了分页链接的信息，每个链接是一个对象，包含了 url、label、page 和 active 等字段|
|»»» url|string¦null|true|none|指向该页的 URL|none|
|»»» label|string|true|none|页码的显示文本（例如 "1" 或 "« 上一页"）|none|
|»»» page|integer¦null|true|none|页码|none|
|»»» active|boolean|true|none|指示该链接是否为当前页，如果是当前页则为 true，否则为 false|none|
|»» next_page_url|string|true|none|下一页的 URL，如果没有更多页则为 null|none|
|»» path|string|true|none|生成分页 URL 的基础路径|none|
|»» per_page|integer|true|none|每页显示的数据条数|none|
|»» prev_page_url|null|true|none|前一页的 URL，如果没有前一页则为 null|none|
|»» to|integer|true|none|当前页数据的结束位置（基于 1 的索引）|none|
|»» total|integer|true|none|数据总条数|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取单个可视化配置详情

GET /api/visualization-configs/{visualization_id}

获取单个可视化配置详情

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|visualization_id|path|string| 是 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": "2",
    "name": "五岳智游数据可化-6",
    "flyline_chart": {
      "id": 1,
      "name": "全国旅游流向5",
      "points": [
        {
          "name": "北京",
          "coordinate": [
            0.5,
            0.4
          ]
        },
        {
          "name": "上海",
          "coordinate": [
            0.7,
            0.5
          ]
        }
      ],
      "lines": [
        {
          "source": "北京",
          "target": "上海"
        }
      ],
      "description": "主要城市间游客流向",
      "main_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/kA6RDxEjmR9AuNPP6OBFlQ8bo0j4332mEDbvOZ7j.png",
      "sub_image": "http://www.wuyue-tourism-dashboard.com/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
      "point_image_path": "/storage/flylines/1GQFr93VPvP4Cyc3reBOgVET5WkQSbD1IhCiR72G.jpg",
      "extra_config": "{}",
      "created_at": "2025-09-27T05:56:25.000000Z",
      "updated_at": "2025-10-07T05:56:28.000000Z"
    },
    "background_image": "http://www.wuyue-tourism-dashboard.com/storage/visualizations/XHOuEIx2mWBbXckg12KFCIraX83ITBqAQUosDXOb.jpg",
    "config_json": "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd', '#235fa7']\", \"echartsAnimationTime\": 1500}",
    "monthlyStats": [
      {
        "mountain_name": "华山",
        "mountain_monthly_stats": [
          {
            "id": 121,
            "year": 2025,
            "month": 1,
            "tourist_count": 7552,
            "income": "25064821.30",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 122,
            "year": 2025,
            "month": 2,
            "tourist_count": 210486,
            "income": "41561252.84",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 123,
            "year": 2025,
            "month": 3,
            "tourist_count": 496742,
            "income": "8447848.37",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 124,
            "year": 2025,
            "month": 4,
            "tourist_count": 60946,
            "income": "4979943.31",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 125,
            "year": 2025,
            "month": 5,
            "tourist_count": 216566,
            "income": "19553941.67",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 126,
            "year": 2025,
            "month": 6,
            "tourist_count": 447095,
            "income": "24487115.55",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 127,
            "year": 2025,
            "month": 7,
            "tourist_count": 65461,
            "income": "36952535.82",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 128,
            "year": 2025,
            "month": 8,
            "tourist_count": 99744,
            "income": "24770993.03",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 129,
            "year": 2025,
            "month": 9,
            "tourist_count": 253334,
            "income": "46649291.14",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 130,
            "year": 2025,
            "month": 10,
            "tourist_count": 197582,
            "income": "8301523.56",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 131,
            "year": 2025,
            "month": 11,
            "tourist_count": 391463,
            "income": "20936965.50",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 132,
            "year": 2025,
            "month": 12,
            "tourist_count": 87693,
            "income": "16291231.53",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          }
        ]
      },
      {
        "mountain_name": "泰山",
        "mountain_monthly_stats": [
          {
            "id": 253,
            "year": 2025,
            "month": 1,
            "tourist_count": 303995,
            "income": "43659946.92",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 254,
            "year": 2025,
            "month": 2,
            "tourist_count": 348969,
            "income": "24411608.73",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 255,
            "year": 2025,
            "month": 3,
            "tourist_count": 423086,
            "income": "2413273.22",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 256,
            "year": 2025,
            "month": 4,
            "tourist_count": 61536,
            "income": "43061662.72",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 257,
            "year": 2025,
            "month": 5,
            "tourist_count": 12484,
            "income": "45815195.59",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 258,
            "year": 2025,
            "month": 6,
            "tourist_count": 342039,
            "income": "31973402.57",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 259,
            "year": 2025,
            "month": 7,
            "tourist_count": 313172,
            "income": "20490097.83",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 260,
            "year": 2025,
            "month": 8,
            "tourist_count": 343624,
            "income": "41018937.67",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 261,
            "year": 2025,
            "month": 9,
            "tourist_count": 35001,
            "income": "31950211.45",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 262,
            "year": 2025,
            "month": 10,
            "tourist_count": 167742,
            "income": "44308407.90",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 263,
            "year": 2025,
            "month": 11,
            "tourist_count": 395206,
            "income": "34906587.27",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          },
          {
            "id": 264,
            "year": 2025,
            "month": 12,
            "tourist_count": 394257,
            "income": "45207346.36",
            "created_at": "2025-09-27T06:04:43.000000Z",
            "updated_at": "2025-09-27T06:04:43.000000Z"
          }
        ]
      },
      {
        "mountain_name": "衡山",
        "mountain_monthly_stats": [
          {
            "id": 385,
            "year": 2025,
            "month": 1,
            "tourist_count": 354840,
            "income": "3331644.53",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 386,
            "year": 2025,
            "month": 2,
            "tourist_count": 206323,
            "income": "24492827.66",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 387,
            "year": 2025,
            "month": 3,
            "tourist_count": 363869,
            "income": "25368162.07",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 388,
            "year": 2025,
            "month": 4,
            "tourist_count": 105275,
            "income": "7899285.93",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 389,
            "year": 2025,
            "month": 5,
            "tourist_count": 181295,
            "income": "40591945.83",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 390,
            "year": 2025,
            "month": 6,
            "tourist_count": 431498,
            "income": "32798912.09",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 391,
            "year": 2025,
            "month": 7,
            "tourist_count": 460352,
            "income": "1526936.88",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 392,
            "year": 2025,
            "month": 8,
            "tourist_count": 94858,
            "income": "5268322.89",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 393,
            "year": 2025,
            "month": 9,
            "tourist_count": 137468,
            "income": "30879266.34",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 394,
            "year": 2025,
            "month": 10,
            "tourist_count": 361874,
            "income": "47950765.13",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 395,
            "year": 2025,
            "month": 11,
            "tourist_count": 114151,
            "income": "7157804.93",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          },
          {
            "id": 396,
            "year": 2025,
            "month": 12,
            "tourist_count": 351922,
            "income": "35927269.92",
            "created_at": "2025-09-27T06:04:44.000000Z",
            "updated_at": "2025-09-27T06:04:44.000000Z"
          }
        ]
      }
    ],
    "annualStats": [
      {
        "mountain_name": "华山",
        "mountain_annual_stats": null
      },
      {
        "mountain_name": "泰山",
        "mountain_annual_stats": {
          "id": 11,
          "year": 2025,
          "height": "1644.00",
          "vegetation_coverage": "70.00",
          "created_at": "2025-09-27T06:04:53.000000Z",
          "updated_at": "2025-09-27T06:04:53.000000Z"
        }
      },
      {
        "mountain_name": "衡山",
        "mountain_annual_stats": null
      }
    ]
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|string|true|none||none|
|»» name|string|true|none|名字|none|
|»» flyline_chart|object|true|none|飞线图信息|none|
|»»» id|integer|true|none||none|
|»»» name|string|true|none|名字|none|
|»»» points|[object]|true|none|点位图|none|
|»»»» name|string|true|none||none|
|»»»» coordinate|[number]|true|none||none|
|»»» lines|[object]|true|none|线性图|none|
|»»»» source|string|false|none||none|
|»»»» target|string|false|none||none|
|»»» description|string|true|none|描述|none|
|»»» main_image|string|true|none|主图|none|
|»»» sub_image|string|true|none|附图|none|
|»»» point_image_path|string|true|none||none|
|»»» extra_config|string|true|none||none|
|»»» created_at|string|true|none||none|
|»»» updated_at|string|true|none||none|
|»» background_image|string|true|none|背景图|none|
|»» config_json|string|true|none||none|
|»» monthlyStats|[object]|true|none|月份统计|none|
|»»» mountain_name|string|true|none|山脉名字|none|
|»»» mountain_monthly_stats|[object]|true|none|山脉月份统计|none|
|»»»» id|integer|true|none||none|
|»»»» year|integer|true|none|年份|none|
|»»»» month|integer|true|none|月份|none|
|»»»» tourist_count|integer|true|none|游客数量|none|
|»»»» income|string|true|none|收入|none|
|»»»» created_at|string|true|none||none|
|»»»» updated_at|string|true|none||none|
|»» annualStats|[object]|true|none|年份统计|none|
|»»» mountain_name|string|true|none|山脉名字|none|
|»»» mountain_annual_stats|object¦null|true|none|山脉年份统计|none|
|»»»» id|integer|true|none||none|
|»»»» year|integer|true|none|年份|none|
|»»»» height|string|true|none|高度|none|
|»»»» vegetation_coverage|string|true|none|植被覆盖率|none|
|»»»» created_at|string|true|none||none|
|»»»» updated_at|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增可视化配置

POST /api/visualization-configs/add

新增可视化配置

> Body 请求参数

```yaml
name: 五岳智游数据可视化
flyline_chart id: 1
mountain_ids: "[1, 2, 3]"
year: 2025
background_image: file://G:\background\龙皓晨-奥斯汀格里芬.jpg
config_json: "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd',
  '#235fa7']\", \"echartsAnimationTime\": 1500}"
is_active: 0

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 否 ||名字|
|» flyline_chart id|body|integer| 否 ||飞线图id|
|» mountain_ids|body|string| 否 ||山脉id数组|
|» year|body|integer| 否 ||年份|
|» background_image|body|string(binary)| 否 ||背景图|
|» config_json|body|string| 否 ||额外配置|
|» is_active|body|integer| 否 ||1 就是启用，0  就是不启用|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "name": "五岳智游数据可化2",
    "year": "2025",
    "config_json": "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd', '#235fa7']\", \"echartsAnimationTime\": 1500}",
    "is_active": "0",
    "background_image": "http://www.wuyue-tourism-dashboard.com/storage/visualizations/F4Wjc5MGXrOEdRyzwUaosLcBO3pP8wnDbbSH9ubW.jpg",
    "updated_at": "2025-09-24T13:50:48.000000Z",
    "created_at": "2025-09-24T13:50:48.000000Z",
    "id": 5,
    "flyline_chart_name": "全国旅游流向5",
    "mountain_names": [
      "华山",
      "泰山",
      "衡山"
    ]
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none|名称|none|
|»» mountain_names|string|true|none|山脉名称数组|none|
|»» year|string|true|none|年份|none|
|»» config_json|string|true|none|额外配置|none|
|»» is_active|string|true|none|是否启用|默认0，1为启用，0为不启用|
|»» background_image|string|true|none|背景图片|none|
|»» updated_at|string|true|none||none|
|»» created_at|string|true|none||none|
|»» id|integer|true|none||none|
|»» flyline_chart_name|string|true|none|飞线图名字|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 更新可视化配置

POST /api/visualization-configs/{visualization_id}/update

更新可视化配置

> Body 请求参数

```yaml
name: 中国飞线图（简化版）
flyline_chart id: 1
mountain_ids: "[1, 2, 3]"
year: 2025
background_image: file://G:\background\龙皓晨-奥斯汀格里芬.jpg
config_json: "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd',
  '#235fa7']\", \"echartsAnimationTime\": 1500}"
is_active: 0

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|visualization_id|path|string| 是 ||none|
|_method|query|string| 否 ||patch请求（不可缺少，值必须是PATCH）|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 否 ||none|
|» flyline_chart id|body|integer| 否 ||飞线图id|
|» mountain_ids|body|string| 否 ||山脉id数组|
|» year|body|integer| 否 ||年份|
|» background_image|body|string(binary)| 否 ||背景图|
|» config_json|body|string| 否 ||none|
|» is_active|body|integer| 否 ||1 就是启用，0  就是不启用|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 2,
    "name": "五岳智游数据可化-6",
    "year": 2025,
    "background_image": "http://www.wuyue-tourism-dashboard.com/storage/visualizations/XHOuEIx2mWBbXckg12KFCIraX83ITBqAQUosDXOb.jpg",
    "config_json": "{\"title\": \"五岳智游数据可视化\", \"borderColor\": \"['#4fd2dd', '#235fa7']\", \"echartsAnimationTime\": 1500}",
    "is_active": 0,
    "created_at": "2025-09-24T05:51:39.000000Z",
    "updated_at": "2025-09-24T13:53:11.000000Z",
    "flyline_chart_name": "全国旅游流向5",
    "mountain_names": [
      "华山",
      "泰山",
      "衡山"
    ]
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名称|none|
|»» mountain_names|string|true|none|山脉名称数组|none|
|»» year|integer|true|none|年份|none|
|»» background_image|string|true|none|背景图|none|
|»» config_json|string|true|none|额外配置|none|
|»» is_active|integer|true|none|是否启用|默认0，1为启用，0为不启用|
|»» created_at|string|true|none||none|
|»» updated_at|string|true|none||none|
|»» flyline_chart_name|string|true|none|飞线图名字|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## PATCH 更新可视化配置激活状态

PATCH /api/visualization-configs/{visualization_id}/active/update

更新可视化配置激活状态

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|visualization_id|path|string| 是 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "激活成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 404 Response

```json
{
  "code": 404,
  "msg": "请求的资源不存在"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **404**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除可视化配置

DELETE /api/visualization-configs/{visualization_id}/delete

删除可视化配置

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|visualization_id|path|string| 是 ||none|
|Authorization|header|string| 否 ||none|
|Accept|header|string| 是 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 管理员

## POST 管理员登录

POST /api/admin/login

管理员登录

> Body 请求参数

```json
{
  "email": "string",
  "password": "string"
}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» email|body|string| 是 | 邮箱|none|
|» password|body|string| 是 | 密码|none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "登录成功",
  "data": {
    "id": 3,
    "name": "admin02",
    "email": "admin02@wuyue.com",
    "role": "admin",
    "token": "0435500bde84a8803f0d6fb7fa215219acefc70e0cbfdccfeed5bb272ec272d4a4bcde9c08065cbd",
    "status": 1,
    "avatar": "https://i.pravatar.cc/150?img=5",
    "last_login_at": "2025-09-25T06:08:54.680632Z"
  }
}
```

> 401 Response

```json
{
  "code": 401,
  "msg": "邮箱错误"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» token|string|true|none|token令牌|none|
|»» status|integer|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|true|none|头像|none|
|»» last_login_at|string|true|none|最后一次登录时间|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 管理员登出

POST /api/admin/{admin}/logout

管理员登出

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|admin|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "登出成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取管理员个人信息

GET /api/admin/

获取管理员个人信息

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 9,
    "name": "张三2",
    "email": "zhangsan@gmail.com",
    "role": "super",
    "token": "7ccgft36h3h4u2h5h2k43h5pj305797e8d497318c9ffadbc86e13725492783f82db103a0404857551a48fb6",
    "status": 1,
    "avatar": "http://www.wuyue-tourism-dashboard.com/storage/avatars/S0CFA5TUQx3XEEq4wCFulAiwVSwxlRkE3JBnLrO4.png",
    "last_login_at": null
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» token|string|true|none|token|none|
|»» status|integer|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|true|none|头像|none|
|»» last_login_at|null|true|none|最后一次登录时间|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 更新管理员个人信息

POST /api/admin/update-profile

更新管理员个人信息

> Body 请求参数

```yaml
name: 张三
email: zhangsan@gmail.com
password: zhangsan_123456
avatar: file://G:\background\动漫人物 (3).png

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|_method|query|string| 否 ||patch请求（不可缺少，值必须是PATCH）|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 否 ||名字|
|» email|body|string| 否 ||邮箱|
|» password|body|string| 否 ||密码|
|» avatar|body|string(binary)| 否 ||头像|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 9,
    "name": "张三5",
    "email": "zhangsan1@gmail.com",
    "role": "admin",
    "token": "7ccgft36h3h4u2h5h2k43h5pj305797e8d497318c9ffadbc86e13725492783f82db103a0404857551a48fb6",
    "status": 1,
    "avatar": "http://www.wuyue-tourism-dashboard.com/storage/avatars/Cu0nHVvvb3eGRU574vWuKCYpQgp0eFdePjNB0DVY.jpg",
    "last_login_at": null
  }
}
```

> 400 Response

```json
{
  "code": 400,
  "msg": "超级管理员不能修改自己的角色"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

> 403 Response

```json
{
  "code": 403,
  "msg": "需要超级管理员权限"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» token|string|true|none|token令牌|none|
|»» status|integer|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|true|none|头像|none|
|»» last_login_at|null|true|none|最后一次登录时间|none|

状态码 **400**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **403**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 管理员/超级管理员

## GET 获取所有管理员信息列表

GET /api/admin/super/list

超级管理员：获取所有管理员信息列表

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 1,
      "name": "superAdmin",
      "email": "superadmin@wuyue.com",
      "role": "super",
      "token": "727f9d36527a652f4c9cb4b7e30e8699d04da0d34bd1984a0bdf6e4c64c3632fcaa415268f28a47e",
      "status": 1,
      "avatar": "https://i.pravatar.cc/150?img=47",
      "last_login_at": null
    },
    {
      "id": 2,
      "name": "admin01",
      "email": "admin01@wuyue.com",
      "role": "admin",
      "token": "33ae0e7a4190a06b2c2f60e3fd1a9c8d0f03b6c6786dc3489f40d29a78938bd96b2704a59d64d33b",
      "status": 1,
      "avatar": "https://i.pravatar.cc/150?img=43",
      "last_login_at": null
    },
    {
      "id": 3,
      "name": "admin02",
      "email": "admin02@wuyue.com",
      "role": "admin",
      "token": "6cc08b06bd9049c18c305797e8d497318c9ffadbc86e13725492783f82db103a0404857551a48fb6",
      "status": 1,
      "avatar": "https://i.pravatar.cc/150?img=5",
      "last_login_at": "2025-09-25 14:46:33"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» token|string|true|none|token令牌|none|
|»» status|integer|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|true|none|头像|none|
|»» last_login_at|string¦null|true|none|最后一次登录时间|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 按邮箱查询管理员

GET /api/admin/super/search/email

超级管理员：按邮箱查询管理员

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|admin_email|query|string| 否 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": [
    {
      "id": 3,
      "name": "admin02",
      "email": "admin02@wuyue.com",
      "role": "admin",
      "token": "6cc08b06bd9049c18c305797e8d497318c9ffadbc86e13725492783f82db103a0404857551a48fb6",
      "status": "0001",
      "avatar": "https://i.pravatar.cc/150?img=5",
      "last_login_at": "2025-09-25 14:46:33"
    }
  ]
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|[object]|true|none||none|
|»» id|integer|false|none||none|
|»» name|string|false|none|名字|none|
|»» email|string|false|none|邮箱|none|
|»» role|string|false|none|身份|none|
|»» token|string|false|none|token|none|
|»» status|string|false|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|false|none|头像|none|
|»» last_login_at|string¦null|false|none|最后一次登录时间|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## GET 获取单个管理员信息详情

GET /api/admin/super/{admin_id}

超级管理员：获取单个管理员信息详情

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|admin_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 2,
    "name": "admin01",
    "email": "admin01@wuyue.com",
    "role": "admin",
    "token": "33ae0e7a4190a06b2c2f60e3fd1a9c8d0f03b6c6786dc3489f40d29a78938bd96b2704a59d64d33b",
    "status": 1,
    "avatar": "https://i.pravatar.cc/150?img=43",
    "last_login_at": null
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» token|string|true|none|token令牌|none|
|»» status|integer|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|true|none|头像|none|
|»» last_login_at|null|true|none|最后一次登录时间|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 新增管理员

POST /api/admin/super/add

超级管理员：新增管理员

> Body 请求参数

```yaml
name: 张三
email: zhangsan@gmail.com
password: zhangsan_123456
role: admin
avatar: file://G:\background\动漫人物 (3).png

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 否 ||名字|
|» email|body|string| 否 ||邮箱|
|» password|body|string| 否 ||密码|
|» role|body|string| 否 ||身份，是否是超级管理员，默认普通管理员|
|» avatar|body|string(binary)| 否 ||头像|

#### 详细说明

**» role**: 身份，是否是超级管理员，默认普通管理员
超级管理员：“super”
普通管理员：“admin”

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "id": 8,
    "name": "张三",
    "email": "zhangsan@gmail.com",
    "role": "admin",
    "token": null,
    "status": 1,
    "avatar": "http://www.wuyue-tourism-dashboard.com/storage/avatars/unBqkyqOgKic25ndsYqYdc2jYn1mSnzCNMqiWNFx.png",
    "last_login_at": null
  }
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» id|integer|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» token|null|true|none|token令牌|none|
|»» status|integer|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» avatar|string|true|none|头像|none|
|»» last_login_at|null|true|none|最后一次登录时间|none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## POST 更新管理员

POST /api/admin/super/{admin_id}/update

超级管理员：更新管理员
注：`超级管理员可以更改其他超级管理员的身份，但是为了防止没有超级管理员存在，所以不能更改自己的身份`

> Body 请求参数

```yaml
name: 张三
email: zhangsan@gmail.com
password: zhangsan_123456
role: admin
avatar: file://G:\background\动漫人物 (3).png
status: 1

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|admin_id|path|string| 是 ||none|
|_method|query|string| 否 ||patch请求（不可缺少，值必须是PATCH）|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|
|» name|body|string| 否 ||名字|
|» email|body|string| 否 ||邮箱|
|» password|body|string| 否 ||密码|
|» role|body|string| 否 ||身份，是否是超级管理员，默认普通管理员|
|» avatar|body|string(binary)| 否 ||头像|
|» status|body|integer| 否 ||账号是否封禁|

#### 详细说明

**» role**: 身份，是否是超级管理员，默认普通管理员
超级管理员：“super”
普通管理员：“admin”

**» status**: 账号是否封禁
1=启用，0=禁用

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "请求成功",
  "data": {
    "name": "张三1",
    "email": "zhangsan1@gmail.com",
    "role": "admin",
    "avatar": "http://www.wuyue-tourism-dashboard.com/storage/avatars/W7nftvziUJrKpEcwRn9Nm8ReslPRvvKnKmaHGZlC.jpg",
    "status": "1",
    "id": "10"
  }
}
```

> 400 Response

```json
{
  "code": 400,
  "msg": "超级管理员不能修改自己的角色"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|
|» data|object|true|none||none|
|»» name|string|true|none|名字|none|
|»» email|string|true|none|邮箱|none|
|»» role|string|true|none|身份|none|
|»» avatar|string|true|none|头像|none|
|»» status|string|true|none|状态|账号是否封禁<br />1=启用，0=禁用|
|»» id|string|true|none||none|

状态码 **400**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

## DELETE 删除管理员

DELETE /api/admin/super/{admin_id}/delete

超级管理员：删除管理员

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|中文名|说明|
|---|---|---|---|---|---|
|admin_id|path|string| 是 ||none|
|Accept|header|string| 否 ||none|
|Authorization|header|string| 否 ||none|
|body|body|object| 否 ||none|

> 返回示例

> 200 Response

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

> 401 Response

```json
{
  "code": 403,
  "msg": "未认证"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

状态码 **401**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» msg|string|true|none||none|

# 数据模型

