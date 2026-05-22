{if $ErrorMsg}
    {include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
    {include file="error/notifications" value="$SuccessMsg" url=""}
{/if}

<style type="text/css">
.product-divert-setting {
  color: #1f2937;
}
.product-divert-setting .setting-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 16px;
  padding-bottom: 22px;
  margin-bottom: 24px;
  border-bottom: 1px solid #eef2f7;
}
.product-divert-setting .setting-title {
  margin: 0 0 8px;
  font-size: 24px;
  font-weight: 700;
  color: #111827;
}
.product-divert-setting .setting-desc {
  margin: 0;
  color: #6b7280;
}
.product-divert-setting .setting-badge {
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
.product-divert-setting .setting-grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 18px;
}
.product-divert-setting .setting-item {
  min-height: 98px;
  padding: 18px;
  border: 1px solid #eef2f7;
  border-radius: 8px;
  background: #fff;
}
.product-divert-setting .setting-item-wide {
  grid-column: 1 / -1;
}
.product-divert-setting .setting-item-head {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  margin-bottom: 12px;
}
.product-divert-setting .setting-label {
  display: flex;
  align-items: center;
  gap: 6px;
  margin: 0;
  font-weight: 600;
  color: #111827;
}
.product-divert-setting .setting-help {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 18px;
  height: 18px;
  border-radius: 50%;
  background: #eff6ff;
  color: #2563eb;
  font-size: 12px;
  cursor: help;
}
.product-divert-setting .setting-help-text {
  position: absolute;
  left: 50%;
  bottom: 24px;
  z-index: 999;
  display: none;
  width: 220px;
  padding: 10px 12px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
  box-shadow: 0 10px 28px rgba(15, 23, 42, .12);
  color: #374151;
  font-size: 13px;
  line-height: 1.5;
  transform: translateX(-50%);
}
.product-divert-setting .setting-help:hover .setting-help-text {
  display: block;
}
.product-divert-setting .setting-tip {
  margin: 8px 0 0;
  color: #6b7280;
  font-size: 13px;
  line-height: 1.5;
}
.product-divert-setting .number-input {
  display: flex;
  align-items: center;
  gap: 8px;
}
.product-divert-setting .number-input .form-control {
  width: 180px;
  max-width: 100%;
}
.product-divert-setting .input-unit {
  color: #6b7280;
  white-space: nowrap;
}
.product-divert-setting .product-select {
  width: 100% !important;
}
.product-divert-setting .form-actions {
  display: flex;
  gap: 10px;
  margin-top: 24px;
  padding-top: 22px;
  border-top: 1px solid #eef2f7;
}
@media (max-width: 991px) {
  .product-divert-setting .setting-grid {
    grid-template-columns: 1fr;
  }
  .product-divert-setting .setting-header {
    flex-direction: column;
  }
}
</style>

<form method="post" action="{:shd_addon_url('ProductDivert://AdminIndex/setting')}" class="needs-validation product-divert-setting" novalidate>
  <section class="admin-main">
    <div class="container-fluid">
      <div class="page-container">
        <div class="card">
          <div class="card-body">
            <div class="setting-header">
              <div>
                <h3 class="setting-title">产品转移设置</h3>
                <p class="setting-desc">配置产品转移开关、实名认证要求、费用与可转移产品范围。</p>
              </div>
              <span class="setting-badge">Product Divert</span>
            </div>

            <div class="setting-grid">
              <div class="setting-item">
                <div class="setting-item-head">
                  <label class="setting-label" for="customSwitchsizemd">启用产品转移</label>
                  <div class="custom-control custom-switch" dir="ltr">
                    <input type="checkbox" name="is_open" value="{$system['is_open']}" {if $system['is_open']==1}checked{/if} class="custom-control-input js-switch-value" id="customSwitchsizemd">
                    <label class="custom-control-label" for="customSwitchsizemd"></label>
                  </div>
                </div>
                <p class="setting-tip">关闭后，前台不会展示产品转移入口。</p>
              </div>

              <div class="setting-item">
                <div class="setting-item-head">
                  <label class="setting-label" for="realnameRequiredSwitch">需要实名认证</label>
                  <div class="custom-control custom-switch" dir="ltr">
                    <input type="checkbox" name="realname_required" value="{$system['realname_required']}" {if $system['realname_required']==1}checked{/if} class="custom-control-input js-switch-value" id="realnameRequiredSwitch">
                    <label class="custom-control-label" for="realnameRequiredSwitch"></label>
                  </div>
                </div>
                <p class="setting-tip">开启后，发起转出和接收转入都需要当前账号已通过实名认证。</p>
              </div>

              <div class="setting-item">
                <label class="setting-label">
                  转移有效期
                  <span class="setting-help">?
                    <span class="setting-help-text">超过该时间未接受的转出，将会被自动关闭。</span>
                  </span>
                </label>
                <div class="number-input">
                  <input class="form-control" min="1" type="number" name="validity_period" value="{$system['validity_period']}" onkeyup="f(this)">
                  <span class="input-unit">天</span>
                </div>
              </div>

              <div class="setting-item">
                <label class="setting-label">
                  保护期
                  <span class="setting-help">?
                    <span class="setting-help-text">产品订购后多久才能转移，0 表示不限制。</span>
                  </span>
                </label>
                <div class="number-input">
                  <input class="form-control" min="0" type="number" name="protection_period" value="{$system['protection_period']}" onkeyup="f(this)">
                  <span class="input-unit">天</span>
                </div>
              </div>

              <div class="setting-item">
                <label class="setting-label">转出费用</label>
                <div class="number-input">
                  <input class="form-control" min="0" type="number" name="push_cost" value="{$system['push_cost']}" onkeyup="f(this)">
                  <span class="input-unit">元</span>
                </div>
              </div>

              <div class="setting-item">
                <label class="setting-label">转入费用</label>
                <div class="number-input">
                  <input class="form-control" min="0" type="number" name="pull_cost" value="{$system['pull_cost']}" onkeyup="f(this)">
                  <span class="input-unit">元</span>
                </div>
              </div>

              <div class="setting-item setting-item-wide">
                <label class="setting-label">
                  转移产品范围
                  <span class="setting-help">?
                    <span class="setting-help-text">多选选择支持自助转移的产品。</span>
                  </span>
                </label>
                <select id="usertype" name="product_range[]" class="selectpicker show-tick form-control product-select" multiple data-live-search="false" multiple="multiple">
                  {foreach $productgroups as $group}
                    <option disabled>{$group.name}</option>
                    {foreach $res_products[$group.id] as $product}
                      <option value="{$product.id}" {if in_array($product.id,$selected)}selected{/if}>--{$product.name}</option>
                    {/foreach}
                  {/foreach}
                </select>
                <p class="setting-tip">未选中的产品不会展示转移入口，也无法发起转移。</p>
              </div>
            </div>

            <div class="form-actions">
              <button type="submit" class="btn btn-primary w-md">保存更改</button>
              <button type="button" class="btn btn-outline-secondary w-md" onclick="javascript:location.reload();">取消更改</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</form>
<script>
  $('.js-switch-value').on('change', function () {
    $(this).val(this.checked ? 1 : 0);
  });
  function f(d) {
    d.value = d.value.replace(/\-/g, "");
  }
</script>
