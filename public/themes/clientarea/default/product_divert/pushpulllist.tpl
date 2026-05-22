{include file="includes/tablestyle"}
{include file="includes/deleteConfirm"}

<style>
.product-divert-list {
    color: #1f2937;
}
.product-divert-list .list-header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 16px;
    padding: 20px 0 18px;
}
.product-divert-list .list-title {
    margin: 0 0 6px;
    font-size: 22px;
    font-weight: 700;
    color: #111827;
}
.product-divert-list .list-desc {
    margin: 0;
    color: #6b7280;
}
.product-divert-list .table-container {
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    background: #fff;
    overflow: hidden;
}
.product-divert-list .table-responsive {
    min-height: 385px;
}
.product-divert-list .table {
    width: 100%;
    margin-bottom: 0;
    color: #374151;
}
.product-divert-list .table thead th {
    padding: 12px 14px;
    border: 0;
    border-bottom: 1px solid #e5e7eb;
    background: #f8fafc;
    color: #6b7280;
    font-size: 13px;
    font-weight: 600;
    white-space: nowrap;
}
.product-divert-list .table td {
    padding: 14px;
    border-color: #edf2f7;
    vertical-align: middle;
    white-space: nowrap;
}
.product-divert-list .product-cell {
    max-width: 300px;
    overflow: hidden;
    color: #111827;
    font-weight: 600;
    text-overflow: ellipsis;
}
.product-divert-list .fee-pill,
.product-divert-list .type-pill,
.product-divert-list .status-pill {
    display: inline-flex;
    align-items: center;
    height: 26px;
    padding: 0 10px;
    border-radius: 999px;
    font-size: 12px;
    font-weight: 600;
}
.product-divert-list .fee-pill {
    background: #f3f4f6;
    color: #374151;
}
.product-divert-list .type-pill.is-push {
    background: #eef6ff;
    color: #2563eb;
}
.product-divert-list .type-pill.is-pull {
    background: #ecfdf5;
    color: #047857;
}
.product-divert-list .status-pill {
    background: #f3f4f6;
    color: #374151;
}
.product-divert-list .action-links {
    display: flex;
    align-items: center;
    gap: 10px;
}
.product-divert-list .table-footer {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 16px;
    padding: 16px;
    border-top: 1px solid #eef2f7;
}
.product-divert-list .table-pageinfo {
    color: #6b7280;
    text-align: right;
}
.product-divert-list #limitSel {
    min-width: 76px;
    height: 32px;
    border: 1px solid #d1d5db;
    border-radius: 6px;
    color: #374151;
}
.product-divert-list .pagination {
    margin: 0;
}
.product-divert-list .no-data {
    padding: 34px 0;
    color: #9ca3af;
    text-align: center;
}
@media (max-width: 767px) {
    .product-divert-list .list-header,
    .product-divert-list .table-footer {
        align-items: stretch;
        flex-direction: column;
    }
    .product-divert-list .table-pageinfo {
        text-align: left;
    }
}
</style>

<div class="product-divert-list">
    <div class="list-header">
        <div>
            <h4 class="list-title">产品转移列表</h4>
            <p class="list-desc">查看您发起或接收的产品转移记录。</p>
        </div>
    </div>

    <div class="table-container">
        <div class="table-responsive">
            <table class="table tablelist">
                <thead>
                <tr>
                    <th class="pointer" prop="id"><span>商品</span></th>
                    <th class="pointer" prop="type"><span>交易方</span></th>
                    <th class="pointer" prop="subtotal"><span>费用</span></th>
                    <th class="pointer" prop="paid_time"><span>类型</span></th>
                    <th class="pointer" prop="due_time"><span>状态</span></th>
                    <th width="180px">操作</th>
                </tr>
                </thead>
                <tbody>
                {if !empty($product_divert)}
                    {foreach $product_divert as $pro}
                        <tr>
                            <td><div class="product-cell" title="{$pro.product_name} {$pro.product_domain} {$pro.product_ip}">{$pro.product_name} {$pro.product_domain} {$pro.product_ip}</div></td>
                            <td>{if $pro.push_userid == $user_now}{$pro.pull_username}{else}{$pro.push_username}{/if}</td>
                            <td>
                                <span class="fee-pill">
                                    {if $pro.push_userid == $user_now}
                                        ￥{$pro.push_cost}元
                                    {else}
                                        ￥{$pro.pull_cost}元
                                    {/if}
                                </span>
                            </td>
                            <td>
                                {if $pro.push_userid == $user_now}
                                    <span class="type-pill is-push">转出</span>
                                {else}
                                    <span class="type-pill is-pull">转入</span>
                                {/if}
                            </td>
                            <td><span class="status-pill">{$pro.status}</span></td>
                            {if $pro.push_userid == $user_now}
                                <td>
                                    <div class="action-links">
                                    {if $pro.push_pay_status == 'Unpaid'}
                                        <a href="javascript: payamount({$pro.push_invoice_id});" class="text-primary"><i class="fas fa-check-circle"></i> {$Lang.payment}</a>
                                        <a href="/product_divert/pushrefuse?id={$pro.id}" class="text-primary"><i class="fas fa-times-circle"></i> 取消</a>
                                    {elseif $pro.push_invoice_id > 0}
                                        <a href="/viewbilling?id={$pro.push_invoice_id}" class="text-success"><i class="fas fa-eye"></i> {$Lang.see}</a>
                                    {/if}
                                    </div>
                                </td>
                            {else}
                                <td>
                                    <div class="action-links">
                                    {if empty($pro.pull_invoice_id) && $pro.push_pay_status == 'Paid' && $pro.status == '待接收'}
                                        <a href="/product_divert/pullserver?id={$pro.id}" class="text-success"><i class="fas fa-eye"></i> 接收</a>
                                    {elseif $pro.pull_pay_status == 'Unpaid'}
                                        <a href="javascript: payamount({$pro.pull_invoice_id});" class="text-primary"><i class="fas fa-check-circle"></i> {$Lang.payment}</a>
                                        <a href="/product_divert/pullrefuse?id={$pro.id}" class="text-primary"><i class="fas fa-times-circle"></i> 拒绝</a>
                                    {elseif $pro.pull_invoice_id > 0}
                                        <a href="/viewbilling?id={$pro.pull_invoice_id}" class="text-success"><i class="fas fa-eye"></i> {$Lang.see}</a>
                                        {if $pro.pull_pay_status == 'Paid' && $pro.status == '待接收'}
                                            <a href="/product_divert/verificationResult?id={$pro.id}" class="text-success"><i class="fas fa-sync-alt"></i> 手动验证</a>
                                        {/if}
                                    {/if}
                                    </div>
                                </td>
                            {/if}
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td colspan="6">
                            <div class="no-data">没有任何内容</div>
                        </td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>

        <div class="table-footer">
            <div class="table-pageinfo mr-2">
                <span>共 {$Count|default=0} 条</span>
                <span class="mx-2">
                    每页
                    <select name="" id="limitSel">
                      <option value="10" {if $Limit==10}selected{/if}>10</option>
                      <option value="15" {if $Limit==15}selected{/if}>15</option>
                      <option value="20" {if $Limit==20}selected{/if}>20</option>
                      <option value="50" {if $Limit==50}selected{/if}>50</option>
                      <option value="100" {if $Limit==100}selected{/if}>100</option>
                    </select>
                    条
                </span>
            </div>
            <ul class="pagination pagination-sm">
                {$Pages}
            </ul>
        </div>
    </div>
</div>

{include file="includes/paymodal"}

<script>
    var _url = '';
    var status = '{$Think.get.status}'
    $('.product-divert-list thead .pointer').on('click', function () {
        var sort = '{$Think.get.sort}'
        location.href = '/product_divert/pushpulllist?sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
    })
    $('#statusSel').on('change', function () {
        location.href = "/product_divert/pushpulllist?status=" + $('#statusSel').val() + "&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}"
    });
    $('#limitSel').on('change', function () {
        location.href = '/product_divert/pushpulllist?sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()
    })
</script>
<script src="/themes/clientarea/default/assets/js/billing.js?v={$Ver}"></script>
