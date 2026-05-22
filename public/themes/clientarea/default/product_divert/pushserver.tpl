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
    background: #eef6ff;
    color: #2563eb;
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
    margin-bottom: 22px;
}
.product-divert-label {
    color: #6b7280;
}
.product-divert-value {
    color: #111827;
    font-weight: 600;
    word-break: break-word;
}
.product-divert-input-row {
    margin-bottom: 18px;
}
.product-divert-input-row label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #111827;
}
.product-divert-hint {
    margin: 8px 0 0;
    color: #f59e0b;
    font-size: 13px;
}
#usertext {
    min-height: 24px;
    margin-bottom: 8px;
    font-weight: 700;
}
.product-divert-notice {
    padding: 12px 14px;
    border: 1px solid #fde68a;
    border-radius: 8px;
    background: #fffbeb;
    color: #92400e;
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

<form method="post" action="/product_divert/pushserver" class="needs-validation product-divert-page" novalidate>
    <div class="product-divert-panel">
        <div class="product-divert-panel-header">
            <div>
                <h5 class="product-divert-panel-title">产品转出</h5>
                <p class="product-divert-panel-desc">确认产品与接收账号后发起转移。</p>
            </div>
            <span class="product-divert-badge">转出</span>
        </div>
        <div class="product-divert-panel-body">
            <div class="product-divert-info">
                <div class="product-divert-label">产品</div>
                <div class="product-divert-value">{$product.name} {$product.domain} {$product.dedicatedip}</div>
                {if $system.push_cost > 0}
                    <div class="product-divert-label">转出费用</div>
                    <div class="product-divert-value">{$system.push_cost} 元</div>
                {/if}
            </div>

            <div class="product-divert-input-row">
                <label for="search">接收方账号</label>
                <div id="usertext"></div>
                <input type="text" id="search" class="form-control" placeholder="请输入接收方手机号或邮箱">
                <p class="product-divert-hint">接收方需填写邮箱或手机号码。</p>
            </div>

            <div class="product-divert-notice">
                本次转移您需要支付 {$system.push_cost} 元。支付后，接收方会收到产品转入通知。
            </div>

            <input type="hidden" name="userid" id="userid" class="form-control">
            <input type="hidden" name="id" id="id" value="{$product.hid}" class="form-control">
            <input type="hidden" name="token" id="token" value="{$token}" class="form-control">
        </div>
        <div class="product-divert-actions">
            <button type="button" class="btn btn-outline-secondary" onclick="window.history.go(-1);">取消</button>
            <button type="submit" id="submit" class="btn btn-primary">立即转出</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    $("#submit").hide();
    $('#search').blur(function () {
        var search = this.value;
        $.ajax({
            type: "POST",
            url: '/product_divert/postNameToUser',
            data: {
                tranfer_name: search
            },
            dataType: "json",
            success: function (res) {
                if (res.status == 200) {
                    var name = res.data.username;
                    var long = name.length;
                    var start = Math.floor(long / 2);
                    var nametext = name.substring(-1, start);
                    for (var i = 0; i < start; i++) {
                        nametext += '*';
                    }
                    $('#userid').val(res.data.id);
                    $('#usertext').html(nametext);
                    $("#usertext").css("color", "#dc2626");
                    $("#submit").show();
                } else {
                    alert(res.msg);
                    $('#usertext').html('');
                    $('#userid').val('');
                    $("#submit").hide();
                }
            }
        });
    });
</script>
