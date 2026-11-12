# MIRA DESIGN AI MANAGER v2.0（クラウド接続版）

## 構成
- Web公開：Cloudflare Pages（Free）
- 認証・クラウドDB：Supabase（Free）
- 開発・修正：ChatGPT / Codex
- スマホ：iPhone Safari対応

## 1. Supabaseを設定
1. https://supabase.com/ で無料アカウントを作成し、New project。
2. Project nameは `mira-design-manager` など。DB passwordは自分で安全に保管。
3. SQL Editor > New query を開き、同梱 `supabase_setup.sql` の全内容を貼り付けて Run。
4. Project Settings > API（または Connect）から Project URL と anon / publishable key をコピー。
5. `index.html` を開いたときの初回接続画面に2つを入力する。
   **service_role / secret key は絶対にブラウザへ入れない。**

## 2. Cloudflare Pagesで無料公開
1. https://dash.cloudflare.com/ に登録・ログイン。
2. Workers & Pages > Create application > Pages > Upload assets（Direct Upload）を選択。
3. プロジェクト名を `mira-design-manager` にする。
4. `index.html` を含むフォルダの中身をアップロードしてDeploy。
5. 発行された `https://....pages.dev` をiPhone Safariで開く。

## 3. 初回ログイン
1. 公開URLを開き、Supabase Project URL と anon / publishable keyを設定。
2. メールアドレスとパスワードで新規アカウントを作成。
3. メール確認が必要な場合は確認リンクを開き、ログイン。
4. 案件を登録し、別のブラウザや端末でも同じアカウントでログインして確認。

## 重要な注意
- このMVPは自分の事業管理用です。顧客向けの複数会社SaaSとして販売する前に、組織・役割・招待・監査ログ・バックアップ・プライバシーポリシー等を追加してください。
- RLSによりログインユーザーは自分の行だけを読み書きできます。
- `anon / publishable key` はフロントエンドで使用する公開キーです。`service_role` / secret key は絶対に入力・公開しないでください。
- 無料プランには容量・利用量・休止などの条件があります。重要な顧客データの唯一の保管場所にせず、定期的にCSVを保存してください。
- Cloudflare Pagesの無料枠やSupabase無料枠は提供条件が変更される場合があります。大量利用・商用SaaS化前に各公式料金・利用規約を再確認してください。
