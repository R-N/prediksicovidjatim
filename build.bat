setlocal
SET VERCEL_BUILDER_DEBUG=1
SET VERCEL_BUILD_SYSTEM_REPORT=1
SET NEXT_DEBUG_FUNCTION_SIZE=1
SET NODE_OPTIONS="--max-old-space-size=4096"
echo %VERCEL_BUILD_SYSTEM_REPORT%
vercel dev --debug
endlocal