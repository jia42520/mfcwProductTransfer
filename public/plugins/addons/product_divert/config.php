<?php

return [
    'is_open' => [
        'title' => '是否启用产品转移',
        'type' => 'switch',
        'value' => 0,
        'tip' => '开启后，客户可在支持的产品上发起转移。',
    ],
    'realname_required' => [
        'title' => '是否需要实名认证',
        'type' => 'switch',
        'value' => 0,
        'tip' => '开启后，发起转出和接收转入时都需要当前账号已通过实名认证。',
    ],
    'validity_period' => [
        'title' => '转移有效期',
        'type' => 'text',
        'value' => 7,
        'tip' => '超过该天数未接收的转移会自动关闭。',
    ],
    'push_cost' => [
        'title' => '转出费用',
        'type' => 'text',
        'value' => 0,
        'tip' => '发起转出时需要支付的费用。',
    ],
    'pull_cost' => [
        'title' => '转入费用',
        'type' => 'text',
        'value' => 0,
        'tip' => '接收转入时需要支付的费用。',
    ],
    'protection_period' => [
        'title' => '保护期',
        'type' => 'text',
        'value' => 0,
        'tip' => '产品订购后需等待多少天才允许转移。',
    ],
    'product_range' => [
        'title' => '转移产品范围',
        'type' => 'select',
        'value' => [],
        'tip' => '支持自助转移的产品 ID 列表。',
    ],
];
