use zed_extension_api as zed;

struct BgfxShaderExtension;

impl zed::Extension for BgfxShaderExtension {
    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let path = worktree.which("bgfx_shader_analyzer").ok_or("bgfx_shader_analyzer not found on PATH")?;

        Ok(zed::Command {
            command: path,
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(BgfxShaderExtension);
