<style>
.product-divert-page {
    max-width: 760px;
    margin: 24px auto;
    color: #1f2937;
}
.product-divert-panel {
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    background: #fff;
    box-shadow: 0 12px 30px rgba(15, 23, 42, .06);
}
.product-divert-panel-header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 16px;
    padding: 22px 24px;
    border-bottom: 1px solid #eef2f7;
}
.product-divert-panel-title {
    margin: 0 0 6px;
    font-size: 22px;
    font-weight: 700;
    color: #111827;
}
.product-divert-panel-desc {
    margin: 0;
    color: #6b7280;
}
.product-divert-badge {
    display: inline-flex;
    align-items: center;
    height: 30px;
    padding: 0 12px;
    border-radius: 999px;
    background: #ecfdf5;
    color: #047857;
    font-size: 13px;
    white-space: nowrap;
}
.product-divert-panel-body {
    padding: 24px;
}
.product-divert-info {
    display: grid;
    grid-template-columns: 120px 1fr;
    gap: 14px 18px;
}
.product-divert-label {
    color: #6b7280;
}
.product-divert-value {
    color: #111827;
    font-weight: 600;
    word-break: break-word;
}
.product-divert-notice {
    margin-top: 22px;
    padding: 12px 14px;
    border: 1px solid #bbf7d0;
    border-radius: 8px;
    background: #f0fdf4;
    color: #166534;
    line-height: 1.6;
}
.product-divert-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    padding: 18px 24px;
    border-top: 1px solid #eef2f7;
}
.product-divert-actions .btn {
    min-width: 96px;
}
@media (max-width: 767px) {
    .product-divert-page {
        margin: 16px 0;
    }
    .product-divert-panel-header,
    .product-divert-actions {
        flex-direction: column;
        align-items: stretch;
    }
    .product-divert-info {
        grid-template-columns: 1fr;
        gap: 6px;
    }
}
</style>

<form method="post" action="/product_divert/pullserver" class="needs-validation product-divert-page" novalidate>
    <div class="product-divert-panel">
        <div class="product-divert-panel-header">
            <div>
                <h5 class="product-divert-panel-title">产品接收</h5>
                <p class="product-divert-panel-desc">确认转移来源和费用后接收产品。</p>
            </div>
            <span class="product-divert-badge">转入</span>
        </div>
        <div class="product-divert-panel-body">
            <div class="product-divert-info">
                <div class="product-divert-label">产品</div>
                <div class="product-divert-value">{$product.product_name} {$product.product_domain} {$product.product_ip}</div>
                <div class="product-divert-label">转出方</div>
                <div class="product-divert-value">{$product.push_username}</div>
                {if $product.pull_cost > 0}
                    <div class="product-divert-label">转入费用</div>
                    <div class="product-divert-value">{$product.pull_cost} 元</div>
                {/if}
            </div>
            <div class="product-divert-notice">
                本次转移您需要支付 {$product.pull_cost} 元，支付后产品将会立刻转到您的账户中。
            </div>
            <input type="hidden" name="id" id="id" value="{$product.id}" class="form-control">
        </div>
        <div class="product-divert-actions">
            <a href="/product_divert/pullrefuse?id={$product.id}" class="btn btn-outline-secondary">拒绝接收</a>
            <button type="submit" id="submit" class="btn btn-primary">立即接收</button>
        </div>
    </div>
</form>
