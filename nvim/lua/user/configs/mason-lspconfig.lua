require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" }
})

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
}
