<link type="text/css" href="{$Themes}/assets/libs/toastr/build/toastr.min.css" rel="stylesheet" />
<script src="{$Themes}/assets/libs/toastr/build/toastr.min.js"></script>
<link rel="stylesheet" href="{$Themes}/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v={$Ver}">
<script src="{$Themes}/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v={$Ver}"></script>

<style type="text/css">
.product-divert-admin {
  color: #1f2937;
}
.product-divert-admin .list-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 16px;
  padding-bottom: 20px;
  margin-bottom: 18px;
  border-bottom: 1px solid #eef2f7;
}
.product-divert-admin .list-title {
  margin: 0 0 8px;
  font-size: 22px;
  font-weight: 700;
  color: #111827;
}
.product-divert-admin .list-desc {
  margin: 0;
  color: #6b7280;
}
.product-divert-admin .list-count {
  display: inline-flex;
  align-items: center;
  height: 32px;
  padding: 0 12px;
  border-radius: 999px;
  background: #f3f4f6;
  color: #374151;
  font-size: 13px;
  white-space: nowrap;
}
.product-divert-admin .table-responsive {
  min-height: 385px;
}
.product-divert-admin .table {
  margin-bottom: 0;
  color: #374151;
}
.product-divert-admin .table thead th {
  padding: 12px 14px;
  border: 0;
  border-bottom: 1px solid #e5e7eb;
  background: #f8fafc;
  color: #6b7280;
  font-size: 13px;
  font-weight: 600;
  white-space: nowrap;
}
.product-divert-admin .table td {
  padding: 14px;
  border-color: #edf2f7;
  vertical-align: middle;
  white-space: nowrap;
}
.product-divert-admin .product-name {
  max-width: 260px;
  overflow: hidden;
  color: #111827;
  font-weight: 600;
  text-overflow: ellipsis;
}
.product-divert-admin .fee-stack {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}
.product-divert-admin .fee-pill {
  display: inline-flex;
  align-items: center;
  height: 24px;
  padding: 0 8px;
  border-radius: 999px;
  background: #f3f4f6;
  color: #374151;
  font-size: 12px;
}
.product-divert-admin .status-pill {
  display: inline-flex;
  align-items: center;
  height: 26px;
  padding: 0 10px;
  border-radius: 999px;
  background: #eef6ff;
  color: #2563eb;
  font-size: 12px;
  font-weight: 600;
}
.product-divert-admin .table-footer {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 16px;
  padding-top: 18px;
}
.product-divert-admin .table-pageinfo {
  display: flex;
  align-items: center;
  gap: 12px;
  color: #6b7280;
}
.product-divert-admin #limitSel {
  min-width: 76px;
  height: 32px;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  color: #374151;
}
.product-divert-admin .pagination {
  gap: 6px;
  margin: 0;
}
.product-divert-admin .pagination a {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 32px;
  height: 32px;
  padding: 0 10px;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  color: #374151;
}
@media (max-width: 767px) {
  .product-divert-admin .list-header,
  .product-divert-admin .table-footer,
  .product-divert-admin .table-pageinfo {
    align-items: flex-start;
    flex-direction: column;
  }
}
</style>

<section class="admin-main product-divert-admin">
  <div class="container-fluid">
    <div class="page-container">
      <div class="card">
        <div class="card-body">
          <div class="list-header">
            <div>
              <h3 class="list-title">产品转移记录</h3>
              <p class="list-desc">查看客户发起、接收和关闭的产品转移记录。</p>
            </div>
            <span class="list-count">共 {$pageInfo.count} 条</span>
          </div>

          <div class="table-container">
            <div class="table-responsive">
              <table class="table tablelist">
                <thead>
                  <tr>
                    <th>产品</th>
                    <th>转出人</th>
                    <th>转入人</th>
                    <th>发起时间</th>
                    <th>完成时间</th>
                    <th>费用</th>
                    <th>状态</th>
                  </tr>
                </thead>
                <tbody>
                {if !empty($list)}
                  {foreach $list as $product}
                    <tr>
                      <td><div class="product-name" title="{$product.product_name}">{$product.product_name}</div></td>
                      <td>{$product.push_username}</td>
                      <td>{$product.pull_username}</td>
                      <td>{$product.create_time}</td>
                      <td>{$product.end_time}</td>
                      <td>
                        <div class="fee-stack">
                          <span class="fee-pill">转出 {$product.push_cost}</span>
                          <span class="fee-pill">转入 {$product.pull_cost}</span>
                        </div>
                      </td>
                      <td><span class="status-pill">{$product.status}</span></td>
                    </tr>
                  {/foreach}
                {else}
                  <tr>
                    <td colspan="7">
                      <div class="no-data">暂无转移记录</div>
                    </td>
                  </tr>
                {/if}
                </tbody>
              </table>
            </div>

            <div class="table-footer">
              <div class="table-pageinfo">
                <span>共 {$pageInfo.count} 条</span>
                <span>
                  每页
                  <select name="limit" id="limitSel">
                    <option value="10" {if $pageInfo.limit==10}selected{/if}>10</option>
                    <option value="15" {if $pageInfo.limit==15}selected{/if}>15</option>
                    <option value="20" {if $pageInfo.limit==20}selected{/if}>20</option>
                    <option value="50" {if $pageInfo.limit==50}selected{/if}>50</option>
                    <option value="100" {if $pageInfo.limit==100}selected{/if}>100</option>
                  </select>
                  条
                </span>
              </div>
              <ul class="pagination pagination-sm">
                {foreach $pageInfo.pages as $v}
                  <a href="{:shd_addon_url('ProductDivert://AdminIndex/index')}&page={$v}&limit={$pageInfo.limit}">{$v}</a>
                {/foreach}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script>
  $("#limitSel").on('change', function () {
    var limit = '&limit=' + this.value;
    window.location.href = "{:shd_addon_url('ProductDivert://AdminIndex/index')}" + limit;
  });
</script>
